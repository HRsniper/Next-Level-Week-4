import { NextApiRequest, NextApiResponse } from "next";

import challenges from "./challenges.json";

export default (req: NextApiRequest, res: NextApiResponse) => {
  res.status(200).json(challenges);
};
