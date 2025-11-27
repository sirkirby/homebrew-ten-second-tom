class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.9.6.tar.gz"
  sha256 "66e72e75dfa223811df747e71e44fcd4d2e7dc98f1fc7574816222a48be58dec"
  license "MIT"

  # Bottle (pre-built binary) for Apple Silicon
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.9.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c2b9d6e80ebbe5c5ede14a2281089c73d01a710348514fa8d0cff12905d0369c"
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
