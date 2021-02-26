import { useContext, useEffect, useState } from "react";

import { ChallengeContext } from "../contexts/ChallengeContext";

import styles from "../styles/components/ChallengeBox.module.css";

const ChallengeBox = () => {
  const contextData = useContext(ChallengeContext);
  console.log(contextData);

  const [hasActiveChallenge, setHasActiveChallenge] = useState(true);

  useEffect(() => {}, []);

  return (
    <div className={styles.challengeBoxContainer}>
      {hasActiveChallenge ? (
        <div className={styles.challengeBoxActive}>
          <header>Ganhe 400 xp</header>
          <main>
            <img src="icons/body.svg" alt="body" />
            <strong>Novo desafio</strong>
            <p>Agora caminhe por 3 minutos e estique suas pernas pra você ficar saudável.</p>
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
