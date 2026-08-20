// Placeholder page proving the wiring works: Tailwind utilities,
// a Boxicons icon, the cn() class-merge helper, and the @/ path
// alias. Replace with real content.
import { cn } from "@/lib/utils";

export default function Home() {
  return (
    <div className="flex min-h-screen flex-col items-center justify-center gap-4 bg-neutral-950 text-neutral-100">
      <i className={cn("bx bx-rocket text-4xl text-cyan-400")} />
      <h1 className="text-2xl font-semibold">Tailwind + Boxicons wired up</h1>
      <p className="text-neutral-400">
        Edit <code className="rounded bg-neutral-800 px-1.5 py-0.5">src/pages/Home.tsx</code> to get
        started.
      </p>
    </div>
  );
}
