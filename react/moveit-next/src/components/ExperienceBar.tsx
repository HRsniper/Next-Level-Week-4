import { useContext } from "react";

import { ChallengeContext } from "../contexts/ChallengeContext";

import styles from "../styles/components/ExperienceBar.module.css";

const ExperienceBar = () => {
  const { currentExperience, experienceToNextLevel } = useContext(ChallengeContext);

  return (
    <header className={styles.experienceBar}>
      <span>0 xp</span>

      <div>
        <div style={{ width: `${currentExperience}%` }}></div>

        {currentExperience === 0 ? (
          ""
        ) : (
          <span className={styles.currentExperience} style={{ left: `${currentExperience}%` }}>
            {currentExperience} xp
          </span>
        )}
      </div>

      <span>{experienceToNextLevel} xp</span>
    </header>
  );
};

export { ExperienceBar };
