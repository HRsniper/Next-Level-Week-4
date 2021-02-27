import { createContext, ReactNode, useEffect, useState } from "react";
import Cookie from "js-cookie";

import challenges from "../pages/api/challenges.json";
import { LevelUpModel } from "../components/LevelUpModel";

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

type ChallengeContextProviderPropsType = {
  children: ReactNode;
  level: number;
  currentExperience: number;
  challengesCompleted: number;
};

const ChallengeContext = createContext({} as ChallengeContextType);

function ChallengeContextProvider({ children, ...rest }: ChallengeContextProviderPropsType) {
  const [level, setLevel] = useState(rest.level ?? 1);
  const [currentExperience, setCurrentExperience] = useState(rest.currentExperience ?? 0);
  const [challengesCompleted, setChallengesCompleted] = useState(rest.challengesCompleted ?? 0);
  const [activeChallenge, setActiveChallenge] = useState(null);
  const [IsLevelUpModalOpen, setIsLevelUpModalOpen] = useState(false);

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
    setIsLevelUpModalOpen(true);
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

      {IsLevelUpModalOpen && <LevelUpModel />}
    </ChallengeContext.Provider>
  );
}

export { ChallengeContext, ChallengeContextProvider };
export type { ChallengeContextType, ChallengeContextProviderPropsType, ActiveChallengeType };
