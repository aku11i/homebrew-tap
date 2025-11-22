class Phantom < Formula
  desc "Git worktree manager with enhanced functionality"
  homepage "https://github.com/aku11i/phantom"
  url "https://registry.npmjs.org/@aku11i/phantom/-/phantom-2.2.3.tgz"
  sha256 "6519a79cb7e55a23ec5c97db57d0f0da6f4b2f90fd8289d6f2e9d3ddbb8ef673"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]

    # Generate and install shell completions
    generate_completions_from_executable(bin/"phantom", "completion", shells: [:fish, :zsh])
  end

  test do
    system "#{bin}/phantom", "version"
  end
end
