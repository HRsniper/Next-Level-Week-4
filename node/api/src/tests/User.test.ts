import request from "supertest";
import { app } from "../app";

describe("User", () => {
  it("ensure that the user is created with valid parameters", () => {
    request(app).post("/users").send({ name: "user_test", email: "user_test@gmail.com" });
  });
});
