import { createContext, ReactNode, useContext, useState } from "react";

type ChallengeContextType = {
  level: number;
  currentExperience: number;
  challengesCompleted: number;
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

  function levelUp() {
    setLevel(level + 1);
  }

  function startNewChallenge() {
    console.log("new");
  }

  return (
    <ChallengeContext.Provider value={{ level, currentExperience, challengesCompleted, levelUp, startNewChallenge }}>
      {children}
    </ChallengeContext.Provider>
  );
}

export { ChallengeContext, ChallengeContextProvider };
export type { ChallengeContextType, ChallengeContextProviderType };
