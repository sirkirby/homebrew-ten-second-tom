class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.9.4.tar.gz"
  sha256 "5636c47fb5b1569df9087dc5d3260b07d21a836cc531a40986e6e64217bd79f5"
  license "MIT"

  # Bottle (pre-built binary) for Apple Silicon
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.9.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6e9acdc4eef6f5c807986d82bbe21279665accc2cbe72db40c44fec320a4efd4"
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
