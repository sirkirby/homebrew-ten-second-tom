class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "04fb3d0cbd423b788d2bdf8d0932a0a0e280515e0f266007d45ecf71b71ce9c8"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ec58393624d219b8e25ac3c76419d43dfd9774626989bf4ae9b3ee63a7b0a1df"
    sha256 cellar: :any_skip_relocation, sequoia:       "a50b7792a64dd300c46a8cfd1336fe707196a974c8c87068ca44cb1aa20fb57c"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
