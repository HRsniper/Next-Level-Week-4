import { useContext } from "react";

import { ChallengeContext } from "../contexts/ChallengeContext";

import styles from "../styles/components/LevelUpModel.module.css";

const LevelUpModel = () => {
  const { level, closeLevelUpModel } = useContext(ChallengeContext);

  return (
    <div className={styles.overlay}>
      <div className={styles.container}>
        <header>{level}</header>
        <strong>Você subiu de nível</strong>
        <p>Continue assim para aumentar seu nível ainda mais e ficar mais saudável</p>

        <button type="button" onClick={closeLevelUpModel}>
          <img src="/icons/close.svg" alt="X" />
        </button>
      </div>
    </div>
  );
};

export { LevelUpModel };
