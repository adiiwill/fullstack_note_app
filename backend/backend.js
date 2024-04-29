const express = require("express");
const app = express();

app.use(express.json());

const cors = require("cors");
app.use(cors());

// Get routes and apply them
const userRoute = require("./routes/User");
const authRoute = require("./routes/Auth");
const noteRoute = require("./routes/Note");
const admiRoute = require("./routes/Admin");

app.use("/user", userRoute);
app.use("/auth", authRoute);
app.use("/note", noteRoute);
app.use("/admin", admiRoute);

app.get("/", (req, res) => {
  res.send("Online");
});

// Run the server
app.listen(22001, () => {
  console.log("The server is running.");
});