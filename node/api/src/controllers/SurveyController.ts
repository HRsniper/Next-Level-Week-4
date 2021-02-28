import { Request, Response } from "express";
import { getCustomRepository } from "typeorm";

import { SurveyRepository } from "../repositories/SurveyRepository";

type RequestType = {
  id: string;
  title: string;
  description: string;
  created_at: Date;
};

class SurveyController {
  async create(request: Request, response: Response) {
    const { title, description }: RequestType = request.body;

    const surveyRepository = getCustomRepository(SurveyRepository);

    // const surveyAlreadyExists = await surveyRepository.findOne({ title });

    // if (surveyAlreadyExists) {
    // response.status(400).json({ message: "survey already exists 😓" });
    // }

    const survey = surveyRepository.create({ title, description });
    await surveyRepository.save(survey);

    return response.status(201).json(survey);
  }
  async list(request: Request, response: Response) {
    const surveyRepository = getCustomRepository(SurveyRepository);
    const surveysExisted = await surveyRepository.find();
    return response.status(200).json(surveysExisted);
  }
}

export { SurveyController };
