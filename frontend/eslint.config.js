import js from "@eslint/js";
import globals from "globals";
import reactHooks from "eslint-plugin-react-hooks";
import reactRefresh from "eslint-plugin-react-refresh";
import tseslint from "typescript-eslint";
import { globalIgnores } from "eslint/config";
import eslintConfigPrettier from "eslint-config-prettier";

export default tseslint.config([
  globalIgnores(["dist"]),
  {
    files: ["**/*.{ts,tsx}"],
    extends: [
      js.configs.recommended,
      tseslint.configs.recommended,
      // Not `recommended-latest` -- as of this plugin's v7 line, that
      // config still exports the legacy plugins-as-array-of-strings
      // format, which flat config rejects. `flat` is the actually
      // flat-config-correct export.
      reactHooks.configs.flat.recommended,
      reactRefresh.configs.vite,
      // Must stay last -- turns off ESLint formatting rules that would
      // otherwise conflict with Prettier's own opinions on the same code.
      eslintConfigPrettier,
    ],
    languageOptions: {
      ecmaVersion: 2020,
      globals: globals.browser,
    },
  },
]);
