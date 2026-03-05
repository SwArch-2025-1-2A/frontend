import { HydrateClient } from "~/trpc/server";
import Hero from "../_components/landingPage/Hero";

export const dynamic = "force-dynamic"

export default async function Home() {
  const hostname = process.env.HOSTNAME;

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
