import { HydrateClient } from "~/trpc/server";
import Hero from "../_components/landingPage/Hero";

export default async function Home() {
  const hostname = process.env.HOSTNAME;

  console.log("Environment Variables")
  console.dir(process.env)

  return (
    <HydrateClient>
      <h2 style={{ color: "gray", fontSize: "14px" }}>
        {hostname && (
          `Servido por: ${hostname}`
        )}
      </h2>
      <main>
        <Hero />
      </main>
    </HydrateClient>
  );
}
