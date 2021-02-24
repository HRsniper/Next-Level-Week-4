import "reflect-metadata";

import express from "express";

import "./database";

const app = express();

app.get("/", (request, response) => response.json({ message: "server running 🚀" }));

app.listen(3333, () => console.log("server running 🚀"));
