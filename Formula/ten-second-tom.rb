class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.9.3.tar.gz"
  sha256 "08f42358f3b576b941d71c9e49be9250c67d26e972abc706a03458bff86bd28b"
  license "MIT"

  # Bottle (pre-built binary) for Apple Silicon
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.9.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "54045d763cf61689f7328556e3b6509283f9ad8a54204ed465b3c16e6034c603"
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
