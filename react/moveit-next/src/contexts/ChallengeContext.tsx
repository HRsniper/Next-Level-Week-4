import { createContext, ReactNode, useEffect, useState } from "react";
import Cookie from "js-cookie";

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
  experienceToNextLevel: number;
  levelUp: () => void;
  startNewChallenge: () => void;
  resetChallenge: () => void;
  completeChallenge: () => void;
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

  const experienceFactor = 4;
  const experienceToNextLevel = Math.pow((level + 1) * experienceFactor, 2);

  useEffect(() => {
    Notification.requestPermission();
  }, []);

  useEffect(() => {
    Cookie.set("level", String(level));
    Cookie.set("currentExperience", String(currentExperience));
    Cookie.set("challengesCompleted", String(challengesCompleted));
  }, [level, currentExperience, challengesCompleted]);

  function levelUp() {
    setLevel(level + 1);
  }

  function startNewChallenge() {
    const randomChallengesIndex = Math.floor(Math.random() * challenges.length);
    const challenge = challenges[randomChallengesIndex];

    setActiveChallenge(challenge);

    new Audio("/notification.mp3").play();

    if (Notification.permission === "granted") {
      new Notification("Novo desafio 💪🏻", { icon: "/favicon.ico", body: `Valendo ${challenge.amount} xp` });
    }
  }

  function resetChallenge() {
    setActiveChallenge(null);
  }

  function completeChallenge() {
    if (!activeChallenge) return;

    const { amount } = activeChallenge;
    let finalExperience = currentExperience + amount;

    if (finalExperience >= experienceToNextLevel) {
      finalExperience = finalExperience - experienceToNextLevel;
      levelUp();
    }

    setCurrentExperience(finalExperience);
    setActiveChallenge(null);
    setChallengesCompleted(challengesCompleted + 1);
  }

  return (
    <ChallengeContext.Provider
      value={{
        level,
        currentExperience,
        challengesCompleted,
        activeChallenge,
        experienceToNextLevel,
        levelUp,
        startNewChallenge,
        resetChallenge,
        completeChallenge
      }}
    >
      {children}
    </ChallengeContext.Provider>
  );
}

export { ChallengeContext, ChallengeContextProvider };
export type { ChallengeContextType, ChallengeContextProviderType, ActiveChallengeType };
