import { Request, Response } from "express";
import { getRepository } from "typeorm";

import { User } from "../database/entities/User";

type RequestType = {
  id: string;
  name: string;
  email: string;
  created_at: Date;
};
class UserController {
  async create(request: Request, response: Response) {
    const { name, email }: RequestType = request.body;

    const userRepository = getRepository(User);

    const userAlreadyExists = await userRepository.findOne({ email });

    if (userAlreadyExists) {
      response.status(400).json({ message: "user already exists 😓" });
    }

    const user = userRepository.create({ name, email });
    await userRepository.save(user);

    response.status(201).json(user);
  }
}

export { UserController };
