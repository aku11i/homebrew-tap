class Phantom < Formula
  desc "Git worktree manager with enhanced functionality"
  homepage "https://github.com/aku11i/phantom"
  url "https://registry.npmjs.org/@aku11i/phantom/-/phantom-1.1.0.tgz"
  sha256 "26c151b4d8dc1bae7bc3e3aaa1c975599e12c6ee356a3c828ffbe248f0e0ba10"
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