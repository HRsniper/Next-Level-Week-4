import { Router } from "express";
import { UserController } from "./controllers/UserController";

const router = Router();

const userController = new UserController();

router.get("/", (request, response) => response.json({ message: "server running 🚀" }));

router.post("/users", userController.create);

export { router };
