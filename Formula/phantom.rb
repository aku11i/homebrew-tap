class Phantom < Formula
  desc "Git worktree manager with enhanced functionality"
  homepage "https://github.com/aku11i/phantom"
  version "3.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aku11i/phantom/releases/download/v3.1.0/phantom-darwin-arm64-3.1.0.tar.gz"
      sha256 "40bd8c7a983718c7339f2addb1fa1259e693fc3d6145ebe2a8e44443afacc1e0"
    end
    on_intel do
      url "https://github.com/aku11i/phantom/releases/download/v3.1.0/phantom-darwin-x64-3.1.0.tar.gz"
      sha256 "29c63d31e1df6c25798fa7d4abc23eb775af2169c3ef88655b0ab27904c689bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aku11i/phantom/releases/download/v3.1.0/phantom-linux-arm64-3.1.0.tar.gz"
      sha256 "80b7cbd5f844b51fb76b979dd651cbf4edd136f75d5d41715c9d2d8d706aa3a1"
    end
    on_intel do
      url "https://github.com/aku11i/phantom/releases/download/v3.1.0/phantom-linux-x64-3.1.0.tar.gz"
      sha256 "6bb5d155305070bb9ade6a65cd7b54e7f180203efadce8dc2b547bae9b109ca3"
    end
  end

  def install
    bin.install "phantom"

    # Generate and install shell completions
    generate_completions_from_executable(bin/"phantom", "completion", shells: [:fish, :zsh])
  end

  test do
    system "#{bin}/phantom", "version"
  end
end
