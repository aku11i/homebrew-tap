# Repository Guidelines

## Project Structure & Module Organization
- `Formula/phantom.rb`: Homebrew formula for the `phantom` CLI; additional tools get their own file with a matching CamelCase class that subclasses `Formula`.
- `README.md`: Tap usage, maintainer steps, and user-facing install docs; keep it aligned with formula updates.
- `LICENSE`: MIT license; leave headers intact when editing.
- Keep the tree minimal—no vendored archives or generated assets should live in the repo.

## Build, Test, and Development Commands
- `brew install --build-from-source ./Formula/phantom.rb`: Build and install locally from the working tree to verify installs.
- `brew test ./Formula/phantom.rb`: Run the formula’s `test do` block (CLI sanity check).
- `brew audit --strict --online ./Formula/phantom.rb`: Style/metadata/lint validation; uses network for homepage and tarball checks.
- `brew uninstall phantom` (then reinstall) when iterating to catch install-time regressions in a clean environment.

## Coding Style & Naming Conventions
- Ruby formula style: 2-space indentation, double-quoted strings, and no trailing whitespace.
- File/class pairing: `formula_name.rb` with class `FormulaName < Formula`; keep `desc`, `homepage`, `url`, `sha256`, and `license` in that order.
- For npm-based tools, prefer `depends_on "node"`, `system "npm", "install", *std_npm_args`, `bin.install_symlink Dir["#{libexec}/bin/*"]`, and add completion generation when the CLI supports it.
- Always update `url` and `sha256` together for releases; use HTTPS tarball sources and avoid inline network calls beyond Homebrew fetch.

## Testing Guidelines
- `test do` should remain fast and offline (e.g., `system "#{bin}/phantom", "version"`). For new tools, choose stable subcommands that avoid mutations or network traffic.
- Add minimal inline fixtures if needed; do not rely on external services in tests.
- Verify with `brew test Formula/<file>.rb` under Homebrew’s sandbox.

## Commit & Pull Request Guidelines
- Commit messages for version bumps: `Update <tool-name> to v<VERSION>`; use imperative wording for other changes.
- PRs should summarize changes (version, checksum, install/test updates), link to upstream release notes when applicable, and note `brew audit --strict --online` plus `brew test` results.
- Keep diffs scoped and avoid formatting-only churn; call out any behavioral changes to install or test steps.

## Version Bump Checklist
- Fetch the latest tarball and compute `sha256` (e.g., `curl -sL <URL> | sha256sum`).
- Update `url`/`sha256`, adjust completions or tests if CLI behavior changed, reinstall via `brew install --build-from-source`, then rerun audit and tests before pushing.
