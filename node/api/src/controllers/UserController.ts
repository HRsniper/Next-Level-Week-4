import { Request, Response } from "express";

class UserController {
  async create(request: Request, response: Response) {
    const { body } = request;

    response.json({ body });
  }
}

export { UserController };
