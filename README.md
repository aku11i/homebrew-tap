# homebrew-tap

Homebrew tap for tools developed by aku11i.

## Installation

```bash
brew tap aku11i/tap
```

## Available Formulas

### phantom

A Git worktree manager with enhanced functionality.

```bash
brew install phantom
```

For more information about phantom, visit the [phantom repository](https://github.com/aku11i/phantom).

## Usage

Once installed, you can use the tools from the command line:

```bash
phantom --help
```

## Updating

To update any installed formula to the latest version:

```bash
brew upgrade <formula-name>
```

For example:
```bash
brew upgrade phantom
```

## Uninstallation

To uninstall a specific formula:

```bash
brew uninstall <formula-name>
```

To remove this tap entirely:

```bash
brew untap aku11i/tap
```

## Maintainer Guide

### Updating Formula Versions

When a new version of a tool is released, follow these steps to update the formula:

#### Method 1: Manual Update

1. **Get the new version's download URL and SHA256**:
   ```bash
   curl -s https://registry.npmjs.org/@aku11i/phantom/-/phantom-<VERSION>.tgz | shasum -a 256
   ```

2. **Update the formula file**:
   - Edit `Formula/<tool-name>.rb`
   - Update the `url` to point to the new version
   - Update the `sha256` with the new checksum

3. **Test the formula locally**:
   ```bash
   brew install --build-from-source ./Formula/<tool-name>.rb
   <tool-name> version  # Verify the new version
   ```

4. **Create a new branch and commit changes**:
   ```bash
   git checkout -b update-<tool-name>-v<VERSION>
   git add Formula/<tool-name>.rb
   git commit -m "Update <tool-name> to v<VERSION>

   🤖 Generated with [Claude Code](https://claude.ai/code)

   Co-Authored-By: Claude <noreply@anthropic.com>"
   ```

5. **Push the branch and create a pull request**:
   ```bash
   git push -u origin update-<tool-name>-v<VERSION>
   gh pr create --title "Update <tool-name> to v<VERSION>" --body "$(cat <<'EOF'
   ## Summary
   - Update <tool-name> formula from vOLD_VERSION to v<VERSION>
   - Update SHA256 hash for the new version

   ## Test plan
   - [x] Verified the new SHA256 hash matches the published package
   - [x] Tested local installation with \`brew install --build-from-source\`
   - [x] Confirmed <tool-name> v<VERSION> is working correctly

   🤖 Generated with [Claude Code](https://claude.ai/code)
   EOF
   )"
   ```

#### Method 2: Using Claude Code (Recommended)

If you have Claude Code available, you can automate most of this process:

1. **Simply mention the new release**:
   ```
   new version of <tool-name> is released!
   ```

2. **Request PR creation**:
   ```
   thanks, create a pr please
   ```

Claude Code will automatically:
- Check the current formula version
- Fetch the latest version from npm
- Calculate the new SHA256 hash
- Update the formula file
- Test the installation locally
- Create a branch, commit changes, and open a PR

## Contributing

If you find any issues with the formulas or have suggestions for improvements, please open an issue or submit a pull request.

## License

This tap is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.