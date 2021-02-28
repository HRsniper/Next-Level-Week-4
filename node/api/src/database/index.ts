import { Connection, createConnection, getConnectionOptions } from "typeorm";

// createConnection();

export default async (): Promise<Connection> => {
  const defaultOptions = await getConnectionOptions();

  return createConnection(
    Object.assign(defaultOptions, {
      // nao é config correta para postgres
      database: process.env.NODE_ENV === "test" ? defaultOptions.database : defaultOptions.database
    })
  );
};
