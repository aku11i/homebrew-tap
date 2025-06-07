class Phantom < Formula
  desc "Git worktree manager with enhanced functionality"
  homepage "https://github.com/aku11i/phantom"
  url "https://registry.npmjs.org/@aku11i/phantom/-/phantom-0.8.1.tgz"
  sha256 "7f7e09f4385176305eba1b70757a04f0465c806bf07c7e8b99a711773aad7164"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/phantom", "version"
  end
end