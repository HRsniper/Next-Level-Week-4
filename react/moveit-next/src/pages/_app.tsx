import type { AppProps } from "next/app";
import { useState } from "react";

import { ChallengeContextProvider } from "../contexts/ChallengeContext";

import "../styles/global.css";

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <ChallengeContextProvider>
      <Component {...pageProps} />;
    </ChallengeContextProvider>
  );
}

export default MyApp;
