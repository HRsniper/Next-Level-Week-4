import { resolve } from "path";
import { Request, Response } from "express";
import { getCustomRepository } from "typeorm";
import { SurveyRepository } from "../repositories/SurveyRepository";
import { SurveyUserRepository } from "../repositories/SurveyUserRepository";
import { UserRepository } from "../repositories/UserRepository";
import SendMailService from "../services/SendMailService";
import { AppError } from "../errors/AppError";

class SendMailController {
  async execute(request: Request, response: Response) {
    //email do usuário e a pesquisa
    const { email, survey_id } = request.body;

    const usersRepository = getCustomRepository(UserRepository);
    const surveysRepository = getCustomRepository(SurveyRepository);
    const surveysUsersRepository = getCustomRepository(SurveyUserRepository);

    const user = await usersRepository.findOne({ email });
    if (!user) {
      throw new AppError("User does not exists 😓");
    }

    const survey = await surveysRepository.findOne({ id: survey_id });
    if (!survey) {
      throw new AppError("Survey does not exists 😓");
    }

    // Verificar se o usuário já respondeu essa pesquisa
    const surveyUserAlreadyExists = await surveysUsersRepository.findOne({
      where: {
        user_id: user.id,
        value: null
      },
      // Para poder ver os dados do usuário e da pesquisa além do cadastro da pesquisa
      // Relacionada no ManyToOne e JoinColumn da classe SurveyUser
      relations: ["user", "survey"]
    });

    const variables = {
      name: user.name,
      title: survey.title,
      description: survey.description,
      id: "",
      link: process.env.URL_MAIL
    };

    const npsPath = resolve(__dirname, "..", "views", "emails", "npsMail.hbs");

    if (surveyUserAlreadyExists) {
      // Já que existe uma survey para esse user, atualizar o id das variáveis
      variables.id = surveyUserAlreadyExists.id;
      // Chamando o serviço de email pra enviar o email
      await SendMailService.execute(email, survey.title, variables, npsPath);
      return response.status(200).json(surveyUserAlreadyExists);
    }

    const surveyUser = surveysUsersRepository.create({
      user_id: user.id,
      survey_id: survey.id
    });

    await surveysUsersRepository.save(surveyUser);
    variables.id = surveyUser.id;

    await SendMailService.execute(email, survey.title, variables, npsPath);

    return response.status(200).json(surveyUser);
  }
}

export { SendMailController };
