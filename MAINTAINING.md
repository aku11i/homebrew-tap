# Maintenance Guide

## Automated Update System

This repository includes GitHub Actions workflows to automatically detect and update to new phantom releases.

### 1. Scheduled Daily Check

The `update-formula.yml` workflow runs daily at midnight (UTC) to check for the latest version in the npm registry. If an update is available, it automatically commits and pushes the changes.

### 2. Manual Updates

#### Option A: Via GitHub Actions (Recommended)

1. Go to the [Actions](https://github.com/aku11i/homebrew-phantom/actions) tab on GitHub
2. Select either "Update Phantom Formula" or "Release Notification"
3. Click "Run workflow"
4. Enter the version number if required and run

#### Option B: Local Update

```bash
# Check latest version
npm view @aku11i/phantom version

# Calculate SHA256
VERSION=0.9.0  # Replace with new version number
curl -sL "https://registry.npmjs.org/@aku11i/phantom/-/phantom-${VERSION}.tgz" | shasum -a 256

# Edit Formula/phantom.rb
# - Update version number in url
# - Update sha256 with new value

# Test
brew install --build-from-source Formula/phantom.rb
phantom version

# Commit & push
git add Formula/phantom.rb
git commit -m "Update phantom to ${VERSION}"
git push
```

## Integration with Phantom Main Repository

To automatically update this tap when releasing phantom, add the following to the phantom release workflow:

```yaml
- name: Notify Homebrew tap
  uses: peter-evans/repository-dispatch@v3
  with:
    token: ${{ secrets.HOMEBREW_TAP_TOKEN }}
    repository: aku11i/homebrew-phantom
    event-type: phantom-release
    client-payload: '{"version": "${{ steps.version.outputs.version }}"}'
```

## Troubleshooting

### Incorrect SHA256

```bash
# Verify correct SHA256
brew fetch --force Formula/phantom.rb
```

### Installation Failures

1. Check Node.js dependencies
2. Verify access to npm registry
3. Check for formula syntax errors

```bash
brew audit --strict Formula/phantom.rb
```

## Formula Update Process

The automated workflows handle:

1. **Version Detection**: Comparing current formula version with npm registry
2. **SHA256 Calculation**: Downloading the tarball and computing checksum
3. **Formula Update**: Using sed to update version and SHA256 in the formula
4. **Git Operations**: Committing and pushing changes or creating pull requests

## Security Considerations

- The workflows use minimal permissions
- SHA256 checksums ensure package integrity
- Pull request workflow allows review before merging