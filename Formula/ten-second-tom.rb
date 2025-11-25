class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "e1cd2724b3212ffaec9b6084d44ac0f77575d32759cba937a89343dc9c0ee5a2"
  license "MIT"

  # Bottle (pre-built binary) for Apple Silicon
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a1704c0c511361bba695368d46c4a7ba1e036f9fdd156948f20f4d9d36b3253e"
  end

  # Dependencies for voice entry feature
  depends_on "ffmpeg"

  def install
    bin.install "tom"
    # Install native macOS extension for notifications
    prefix.install "TenSecondTom.Extensions.MacOS.app" if OS.mac?
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
