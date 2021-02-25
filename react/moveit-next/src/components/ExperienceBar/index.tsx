import styles from "./experienceBar.module.css";

const ExperienceBar = () => {
  return (
    <header className={styles.experienceBar}>
      <span>0 xp</span>

      <div>
        <div style={{ width: "50%" }}></div>

        <span className={styles.currentExperience} style={{ left: "50%" }}>
          300 xp
        </span>
      </div>

      <span>600 xp</span>
    </header>
  );
};

export { ExperienceBar };
