import { Connection, createConnection, getConnectionOptions } from "typeorm";

// createConnection();

export default async (): Promise<Connection> => {
  const defaultOptions = await getConnectionOptions();

  const database_test = { ...defaultOptions };
  database_test.database = "nodenlw4_test";

  return createConnection(
    Object.assign(defaultOptions, {
      database: process.env.NODE_ENV === "test" ? database_test.database : defaultOptions.database
    })
  );
};
