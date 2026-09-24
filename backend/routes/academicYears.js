const express = require("express");
const pool = require("../db");

const router = express.Router();

router.get("/", async (req, res) => {

    try {

        const result = await pool.query(`
            SELECT id,  year_name  FROM academic_years
            ORDER BY year_name DESC
        `);

        res.json(result.rows);

    } catch (error) {

        console.error(error);
        res.status(500).json({
            message: "Failed to load academic years",
            error: error.message
        });
    }
});

module.exports = router;