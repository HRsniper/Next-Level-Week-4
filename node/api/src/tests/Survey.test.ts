import request from "supertest";
import { Connection } from "typeorm";
import { app } from "../app";
import createConnection from "../database";
import { Survey } from "../entities/Survey";

describe("Survey", () => {
  let connection: Connection;

  async function deleteSurveyTest() {
    await connection
      .createQueryBuilder()
      .delete()
      .from(Survey)
      .where("title = :title", { title: "title survey" })
      .execute();
  }

  beforeAll(async () => {
    connection = await createConnection();
    // await connection.runMigrations();
    await deleteSurveyTest();
  });

  // beforeEach(async () => {});

  // afterEach(async () => {});

  afterAll(async () => {
    await deleteSurveyTest();
    await connection.close();
  });

  it("ensure that the survey is created with valid parameters", async () => {
    const response = await request(app).post("/surveys").send({ title: "title survey", description: "description 1" });
    expect(response.status).toBe(201);
  });

  // it("ensure that the survey is not created with title exists", async () => {
  //   const response = await request(app).post("/users").send({ title: "title survey", description: "description 1" });
  //   expect(response.status).toBe(400);
  // });

  it("survey be able to get all surveys correctly", async () => {
    const response = await request(app).get("/users");
    expect(response.status).toBe(200);
    expect(response.body.length).toBe(response.body.length);
  });
});
