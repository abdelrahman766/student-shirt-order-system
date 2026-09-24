const express = require("express");
const cors = require("cors");
require("dotenv").config();

const teamsRouter = require("./routes/teams");
const studentsRouter = require("./routes/students");
const academicYearsRouter = require("./routes/academicYears");
const ordersRouter = require("./routes/orders");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());

app.use(express.json());

app.get("/", (req, res) => {
    res.json({
        message: "T-Shirt Order API is running"
    });
});

app.use("/api/teams", teamsRouter);
app.use("/api/students", studentsRouter);
app.use("/api/academic-years", academicYearsRouter);
app.use("/api/orders", ordersRouter);

app.use((error, req, res, next) => {
    console.error(error);

    res.status(500).json({
        message: "Internal server error"
    });
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});