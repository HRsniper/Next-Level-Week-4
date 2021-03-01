import { Request, Response } from "express";
import { getCustomRepository } from "typeorm";
import * as yup from "yup";
import { AppError } from "../errors/AppError";
import { UserRepository } from "../repositories/UserRepository";

type RequestType = {
  id: string;
  name: string;
  email: string;
  created_at: Date;
};

class UserController {
  async create(request: Request, response: Response) {
    const { name, email }: RequestType = request.body;

    const schema = yup.object().shape({
      name: yup.string().required("Nome é obrigatório!"),
      email: yup.string().email("Email inválido!").required("Email é obrigatório")
    });

    try {
      await schema.validate(request.body, { abortEarly: false });
    } catch (err) {
      throw new AppError(err);
    }

    const userRepository = getCustomRepository(UserRepository);

    const userAlreadyExists = await userRepository.findOne({ email });

    if (userAlreadyExists) {
      response.status(400).json({ message: "user already exists 😓" });
    }

    const user = userRepository.create({ name, email });
    await userRepository.save(user);

    return response.status(201).json(user);
  }

  async list(request: Request, response: Response) {
    const userRepository = getCustomRepository(UserRepository);
    const usersExisted = await userRepository.find();
    return response.status(200).json(usersExisted);
  }
}

export { UserController };
