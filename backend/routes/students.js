const express = require("express");
const pool = require("../db");

const router = express.Router();

router.get("/", async (req, res) => {

    const { team_id } = req.query;

    if (!team_id) {
        return res.status(400).json({
            message: "team_id is required"
        });

    }

    try {

        const result = await pool.query(
            ` SELECT id, full_name FROM students  WHERE team_id = $1
              ORDER BY full_name `, [team_id]
        );

        res.json(result.rows);

    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Failed to load students" });
    }

});

module.exports = router;