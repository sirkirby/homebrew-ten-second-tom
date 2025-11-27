class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.9.7.tar.gz"
  sha256 "a7028f653a426582ad36e4b4bd203db8a215dc4e2829ede9d4e1239eaaa4e5c8"
  license "MIT"

  # Bottle (pre-built binary) for Apple Silicon
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.9.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9a07317ad3339039cbf7ddbfa6f05b11c36a99c29a4987fd8fc2c7dcb1a2fbc2"
  end

  # Dependencies for voice entry feature
  depends_on "ffmpeg"

  def install
    bin.install "tom"
    # Install native macOS extension for notifications
    prefix.install "TenSecondTom.Extensions.MacOS.app" if OS.mac?
    # Ensure notifier binary is executable
    chmod 0755, prefix/"TenSecondTom.Extensions.MacOS.app/Contents/MacOS/notifier" if OS.mac?
  end

  def caveats
    <<~EOS
      Legal: Ten Second Tom is designed for single-user personal use on your own
      device. Recording conversations may require consent in your jurisdiction.
    EOS
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
