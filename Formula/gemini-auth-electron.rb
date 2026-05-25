class GeminiAuthElectron < Formula
  desc "Cross-platform glassmorphic chat engine utilizing secure desktop OAuth configurations"
  homepage "https://github.com/Codemaster-AR/homebrew-gemini_auth-electron"
  url "https://github.com/codemaster-ar/homebrew-gemini_auth-electron/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ec726d7d7dac12100b4645f2a182b0f19f09599c347a29b445fa55b9a3132d0b"
  license "MIT"

  # Core installation layer for Linux & Windows WSL configurations
  depends_on "node" if OS.linux?

  def install
    # 1. Ship all core package elements straight into Homebrew's persistent cell location
    libexec.install Dir["*"]

    # 2. Production build run for dependency tracking
    cd libexec do
      system "npm", "install", "--omit=dev"
    end

    # 3. Universal Symlink mapping
    # Writes an executable binary directly to the system path environment mapping block
    (bin/"gemini-auth-electron").write_env_script libexec/"launcher.sh", {}
  end

  def caveats
    <<~EOS
      If you are running this client inside Windows Subsystem for Linux (WSL),
      ensure your WSL environment is updated to WSL 2 to support Linux GUI rendering (WSLg).
      Simply type 'gemini-auth-electron' to open up your interface loop!
    EOS
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/gemini-auth-electron --version")
  end
end
