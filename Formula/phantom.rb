class Phantom < Formula
  desc "Git worktree manager with enhanced functionality"
  homepage "https://github.com/aku11i/phantom"
  url "https://registry.npmjs.org/@aku11i/phantom/-/phantom-1.2.0.tgz"
  sha256 "532f30ef2ce11dbac28a5d063042e4f742532868f5b5fbbd1ee777caf3ace9a4"
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