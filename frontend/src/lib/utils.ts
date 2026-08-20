import { type ClassValue, clsx } from "clsx";
import { twMerge } from "tailwind-merge";

// Combine conditional class names (clsx) and resolve conflicting
// Tailwind utilities in favor of the last one applied (tailwind-merge) --
// e.g. cn("px-2", condition && "px-4") correctly ends up "px-4",
// not "px-2 px-4" (which clsx alone would produce).
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
