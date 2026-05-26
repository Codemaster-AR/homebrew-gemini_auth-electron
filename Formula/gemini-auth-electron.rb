class GeminiAuthElectron < Formula
  desc "Cross-platform glassmorphic chat engine utilizing secure desktop OAuth configurations"
  homepage "https://github.com/codemaster-ar/homebrew-gemini_auth-electron"
  url "https://github.com/codemaster-ar/homebrew-gemini_auth-electron/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "YOUR_NEW_TARBALL_HASH_HERE"
  license "MIT"

  depends_on "node"

  def install
    # 1. Ship all core package elements straight into Homebrew's persistent cell location
    libexec.install Dir["*"]

    # 2. Universal Symlink mapping
    # Writes an executable binary directly to the system path environment mapping block
    (bin/"gemini-auth-electron").write_env_script libexec/"launcher.sh", {}
  end

  def caveats
    <<~EOS
      If you are running this client inside Windows Subsystem for Linux (WSL),
      ensure your WSL environment is updated to WSL 2 to support Linux GUI rendering (WSLg).
    EOS
  end

  test do
    system "#{bin}/gemini-auth-electron", "--version"
  end
end
