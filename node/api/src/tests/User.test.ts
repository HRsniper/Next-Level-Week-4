import request from "supertest";
import { Connection } from "typeorm";
import { app } from "../app";
import createConnection from "../database";
import { User } from "../entities/User";

describe("User", () => {
  let connection: Connection;

  async function deleteUserTest() {
    await connection
      .createQueryBuilder()
      .delete()
      .from(User)
      .where("email = :email", { email: "user_test@gmail.com" })
      .execute();
  }

  beforeAll(async () => {
    connection = await createConnection();
    // await connection.runMigrations();
    await deleteUserTest();
  });

  // beforeEach(async () => {});

  // afterEach(async () => {});

  afterAll(async () => {
    await deleteUserTest();
    await connection.close();
  });

  it("ensure that the user is created with valid parameters", async () => {
    const response = await request(app).post("/users").send({ name: "user_test", email: "user_test@gmail.com" });
    expect(response.status).toBe(201);
  });

  it("ensure that the user is not created with email exists", async () => {
    const response = await request(app).post("/users").send({ name: "user_test", email: "user_test@gmail.com" });
    expect(response.status).toBe(400);
  });
});
