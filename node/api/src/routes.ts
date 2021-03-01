import { Router } from "express";
import { AnswerController } from "./controllers/AnswerController";
import { NpsController } from "./controllers/NpsController";
import { SendMailController } from "./controllers/SendMailController";
import { SurveyController } from "./controllers/SurveyController";
import { UserController } from "./controllers/UserController";

const router = Router();

const userController = new UserController();
const surveyController = new SurveyController();
const sendMailController = new SendMailController();
const answerController = new AnswerController();
const npsController = new NpsController();

router.get("/", (request, response) => response.json({ message: "server running 🚀" }));

router.post("/users", userController.create);
router.get("/users", userController.list);

router.post("/surveys", surveyController.create);
router.get("/surveys", surveyController.list);

router.post("/sendMail", sendMailController.execute);

router.get("/answers", answerController.list);
router.get("/answers/:value", answerController.execute);

router.get("/nps/:survey_id", npsController.execute);

export { router };
