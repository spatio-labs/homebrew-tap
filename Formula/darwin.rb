class Darwin < Formula
  desc "Standalone CLI for agent-runtime chat interface"
  homepage "https://github.com/spatio-labs/darwin-cli"
  license "MIT"

  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spatio-labs/darwin-cli/releases/download/v1.0.1/darwin-darwin-arm64"
    else
      url "https://github.com/spatio-labs/darwin-cli/releases/download/v1.0.1/darwin-darwin-amd64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spatio-labs/darwin-cli/releases/download/v1.0.1/darwin-linux-arm64"
    else
      url "https://github.com/spatio-labs/darwin-cli/releases/download/v1.0.1/darwin-linux-amd64"
    end
  end

  def install
    bin.install Dir["darwin*"].first => "darwin"
  end

  test do
    # Test that the binary exists and can show help
    assert_match "Agent Runtime Chat", shell_output("#{bin}/darwin --help 2>&1", 0)
  end
end