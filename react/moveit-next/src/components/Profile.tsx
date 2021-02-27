import { useContext } from "react";

import { ChallengeContext } from "../contexts/ChallengeContext";

import styles from "../styles/components/Profile.module.css";

const Profile = () => {
  const { level } = useContext(ChallengeContext);
  return (
    <div className={styles.profileContainer}>
      <img src="https://github.com/HRsniper.png" alt="Avatar" />
      <div>
        <strong>Hercules</strong>
        <p>
          <img src="icons/level.svg" alt="level" />
          Level {level}
        </p>
      </div>
    </div>
  );
};

export { Profile };
