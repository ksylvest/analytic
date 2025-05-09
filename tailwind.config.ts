import type { Config } from "tailwindcss";

export default {
  content: [
    "./app/**/*.html.*",
    "./app/helpers/**/*.rb",
    "./app/**/*.tsx",
    "./app/**/*.jsx",
  ],
} satisfies Config;
