import { useContext, useEffect, useState } from "react";

import { ChallengeContext } from "../contexts/ChallengeContext";

import styles from "../styles/components/ChallengeBox.module.css";

const ChallengeBox = () => {
  const { activeChallenge } = useContext(ChallengeContext);

  useEffect(() => {}, []);

  return (
    <div className={styles.challengeBoxContainer}>
      {activeChallenge ? (
        <div className={styles.challengeBoxActive}>
          <header>Ganhe {activeChallenge.amount} xp</header>
          <main>
            <img src={`icons/${activeChallenge.type}.svg`} alt="body" />
            <strong>Novo desafio</strong>
            <p>{activeChallenge.description}</p>
          </main>

          <footer>
            <button type="button" className={styles.challengeFailedButton} onClick={() => {}}>
              Falhei
            </button>

            <button type="button" className={styles.challengeCompletedButton} onClick={() => {}}>
              Completei
            </button>
          </footer>
        </div>
      ) : (
        <div className={styles.challengeBoxNotActive}>
          <strong>Inicie um ciclo para receber desafios</strong>
          <p>
            <img src="icons/level-up.svg" alt="level up" />
            Avance de level completando os desafios.
          </p>
        </div>
      )}
    </div>
  );
};

export { ChallengeBox };
