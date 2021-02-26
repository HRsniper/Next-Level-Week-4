import { createContext, ReactNode, useState } from "react";

import challenges from "../pages/api/challenges.json";

type ActiveChallengeType = {
  // type: string;
  type: "body" | "eye";
  description: string;
  amount: number;
};

type ChallengeContextType = {
  level: number;
  currentExperience: number;
  challengesCompleted: number;
  activeChallenge: ActiveChallengeType;
  levelUp: () => void;
  startNewChallenge: () => void;
};

type ChallengeContextProviderType = {
  children: ReactNode;
};

const ChallengeContext = createContext({} as ChallengeContextType);

function ChallengeContextProvider({ children }: ChallengeContextProviderType) {
  const [level, setLevel] = useState(1);
  const [currentExperience, setCurrentExperience] = useState(0);
  const [challengesCompleted, setChallengesCompleted] = useState(0);
  const [activeChallenge, setActiveChallenge] = useState(null);

  function levelUp() {
    setLevel(level + 1);
  }

  function startNewChallenge() {
    const randomChallengesIndex = Math.floor(Math.random() * challenges.length);
    const challenge = challenges[randomChallengesIndex];

    setActiveChallenge(challenge);
  }

  return (
    <ChallengeContext.Provider
      value={{ level, currentExperience, challengesCompleted, activeChallenge, levelUp, startNewChallenge }}
    >
      {children}
    </ChallengeContext.Provider>
  );
}

export { ChallengeContext, ChallengeContextProvider };
export type { ChallengeContextType, ChallengeContextProviderType, ActiveChallengeType };
