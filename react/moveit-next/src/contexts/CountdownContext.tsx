import { createContext, ReactNode, useContext, useEffect, useState } from "react";

import { ChallengeContext } from "./ChallengeContext";

type CountdownContextType = {
  time: number;
  isActive: boolean;
  hasFinished: boolean;
  minutes: number;
  seconds: number;
  startCountdown: () => void;
  resetCountdown: () => void;
};

type CountdownContextProviderType = {
  children: ReactNode;
};

const CountdownContext = createContext({} as CountdownContextType);

let countdownTimeout: NodeJS.Timeout;

function CountdownContextProvider({ children }: CountdownContextProviderType) {
  const { startNewChallenge } = useContext(ChallengeContext);

  const initialDefaultTime = 0.1 * 60;

  const [time, setTime] = useState(initialDefaultTime);
  const [isActive, setIsActive] = useState(false);
  const [hasFinished, setHasFinished] = useState(false);

  const minutes = Math.floor(time / 60);
  const seconds = time % 60;

  function startCountdown() {
    setIsActive(true);
  }

  function resetCountdown() {
    clearTimeout(countdownTimeout);
    setIsActive(false);
    setTime(initialDefaultTime);
  }

  useEffect(() => {
    if (isActive && time > 0) {
      countdownTimeout = setTimeout(() => {
        setTime(time - 1);
      }, 1000);
    } else if (isActive && time === 0) {
      setHasFinished(true);
      setIsActive(false);
      startNewChallenge();
    }
  }, [isActive, time]);

  return (
    <CountdownContext.Provider
      value={{ time, isActive, hasFinished, minutes, seconds, startCountdown, resetCountdown }}
    >
      {children}
    </CountdownContext.Provider>
  );
}

export { CountdownContext, CountdownContextProvider };
export type { CountdownContextType, CountdownContextProviderType };
