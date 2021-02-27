import type { AppProps } from "next/app";

// import { ChallengeContextProvider } from "../contexts/ChallengeContext";
// import { CountdownContextProvider } from "../contexts/CountdownContext";

import "../styles/global.css";

function MyApp({ Component, pageProps }: AppProps) {
  return (
    // <ChallengeContextProvider>
      {/* <CountdownContextProvider> */}
        <Component {...pageProps} />;
      {/* </CountdownContextProvider> */}
    // </ChallengeContextProvider>
  );
}

export default MyApp;
