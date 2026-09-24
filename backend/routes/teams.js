const express = require("express");
const pool = require("../db");

const router = express.Router();

router.get("/", async (req, res) => {
    try {
        const result = await pool.query(`
            SELECT id, team_name FROM teams
            ORDER BY team_name `);

        res.json(result.rows);

    } catch (error) {

        console.error("DATABASE ERROR:", error);

        res.status(500).json({
            message: "Failed to load teams",
            error: error.message
        });
    }
});

module.exports = router;