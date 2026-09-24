const express = require("express");
const pool = require("../db");

const router = express.Router();


router.post("/", async (req, res) => {

    try {

        const {  student_id, size, shirt_number, receipt_number, height_cm, weight_kg,
            address, school, academic_year_id } = req.body;

        if (
            !student_id || !size || shirt_number === undefined ||  shirt_number === null ||
            !receipt_number ||  !height_cm ||  !weight_kg ||  !address ||
            !school || !academic_year_id
        ) {

            return res.status(400).json({
                message: "All fields are required"
            });
        }

        const allowedSizes = [ "S", "M", "L", "XL", "2XL" ];

        if (!allowedSizes.includes(size)) {
            return res.status(400).json({
                message: "Invalid shirt size"
            });
        }

        const shirtNumber = Number(shirt_number);

        if ( !Number.isInteger(shirtNumber) ||  shirtNumber < 0 || shirtNumber > 999) {
            return res.status(400).json({
                message: "Shirt number must be between 0 and 999"
            });
        }

        const height = Number(height_cm);

        if (  isNaN(height) ||  height <= 0 ||  height > 300 ) {
            return res.status(400).json({
                message: "Invalid height"
            });
        }


        const weight = Number(weight_kg);

        if ( isNaN(weight) || weight <= 0 ||  weight > 500) {
            return res.status(400).json({
                message: "Invalid weight"
            });
        }

        const studentResult = await pool.query(
            `  SELECT id FROM students  WHERE id = $1 `, [student_id] );

        if (studentResult.rows.length === 0) {
            return res.status(400).json({
                message: "Student not found"
            });
        }


        const yearResult = await pool.query(
          ` SELECT id  FROM academic_years  WHERE id = $1 `,  [academic_year_id] );

        if (yearResult.rows.length === 0) {
            return res.status(400).json({
                message: "Academic year not found"
            });
        }


        // ==============================
        // Insert order
        // ==============================

        const result = await pool.query(
            `
            INSERT INTO shirt_orders
            ( student_id,  size, shirt_number, receipt_number, height_cm, weight_kg,
                address, school,  academic_year_id )
            VALUES
            (  $1, $2, $3, $4, $5, $6, $7, $8, $9 ) RETURNING id  `,

            [
                student_id, size, shirtNumber,  receipt_number,  height,
                weight,  address,  school,  academic_year_id
            ]
        );


        res.status(201).json({
            message: "Order saved successfully",
            order_id: result.rows[0].id
        });


    } catch (error) {
        console.error(  "SAVE ORDER ERROR:",  error );

        res.status(500).json({
            message: "Failed to save order",
            error: error.message
        });
    }
});


router.get("/", async (req, res) => {
    try {
        const result = await pool.query(`
            SELECT  o.id,  t.team_name, s.full_name, o.size,  o.shirt_number,   o.receipt_number,
                o.height_cm,    o.weight_kg,   o.address,  o.school,  ay.year_name, o.created_at

            FROM shirt_orders o

            JOIN students s  ON o.student_id = s.id
            JOIN teams t  ON s.team_id = t.id
            JOIN academic_years ay  ON o.academic_year_id = ay.id

            ORDER BY o.id DESC
        `);

        res.json(result.rows);

    } catch (error) {

        console.error( "GET ORDERS ERROR:",  error );

        res.status(500).json({
            message: "Failed to load orders",
            error: error.message
        });
    }
});
module.exports = router;