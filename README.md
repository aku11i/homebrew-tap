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

1. **Check for the latest version**:
   ```bash
   # Check GitHub releases
   curl -s https://api.github.com/repos/aku11i/phantom/releases/latest | grep tag_name
   
   # Or check npm registry
   curl -s https://registry.npmjs.org/@aku11i/phantom/latest | grep version
   ```

2. **Create a new branch for the update**:
   ```bash
   git checkout -b update-<tool-name>-<version>
   ```

3. **Get the new version's download URL and SHA256**:
   ```bash
   curl -sL https://registry.npmjs.org/@aku11i/phantom/-/phantom-<VERSION>.tgz | sha256sum
   ```

4. **Update the formula file**:
   - Edit `Formula/<tool-name>.rb`
   - Update the `url` to point to the new version
   - Update the `sha256` with the new checksum

5. **Commit and push the changes**:
   ```bash
   git add Formula/<tool-name>.rb
   git commit -m "Update <tool-name> to v<VERSION>"
   ```

   git push -u origin update-<tool-name>-<version>
   ```

6. **Create a pull request**:
   ```bash
   gh pr create --title "Update <tool-name> to v<VERSION>" --body "Updates <tool-name> from v<OLD_VERSION> to v<VERSION> with updated SHA256 checksum."
   ```

## Contributing

If you find any issues with the formulas or have suggestions for improvements, please open an issue or submit a pull request.

## License

This tap is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.