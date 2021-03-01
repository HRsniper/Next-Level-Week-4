import { Request, Response } from "express";
import { getCustomRepository } from "typeorm";
import { AppError } from "../errors/AppError";
import { SurveyUserRepository } from "../repositories/SurveyUserRepository";

class AnswerController {
  async execute(request: Request, response: Response) {
    const { value } = request.params;
    const { survey_user_id } = request.query;

    const surveyUserRepository = getCustomRepository(SurveyUserRepository);

    const surveyUser = await surveyUserRepository.findOne({
      id: String(survey_user_id)
    });

    if (!surveyUser) {
      throw new AppError("Survey User does not exists 😓");
    }

    surveyUser.value = Number(value);

    await surveyUserRepository.save(surveyUser);

    return response.status(201).json(surveyUser);
  }

  async list(request: Request, response: Response) {
    const surveyUserRepository = getCustomRepository(SurveyUserRepository);
    const surveysUsersExisted = await surveyUserRepository.find();
    return response.status(200).json(surveysUsersExisted);
  }
}

export { AnswerController };
