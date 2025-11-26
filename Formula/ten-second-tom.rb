class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.9.5.tar.gz"
  sha256 "eb298216e7e0e6ea559a32a3b7b36a67c50a1b281a79633d2a18736bc8cd11dc"
  license "MIT"

  # Bottle (pre-built binary) for Apple Silicon
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.9.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e950ec0b0d99e89fc95e9750c12840b3dd52637bec304b5cc1d38fbb5348c578"
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
