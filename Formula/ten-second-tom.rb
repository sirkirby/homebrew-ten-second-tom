class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "ea79896f1c5b3d7515e4238db3c425e92c8efc0711aeaef2284632c6cac72b8f"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "60e9edfd34201670288ba3aa86a1d4bb38945784b15ef48b8753467a2a8933ec"
    sha256 cellar: :any_skip_relocation, sequoia:       "8a1fcd7af07ac9f8cb4d866da928a30ce242add7ddaf2a45019366bcf6c4b043"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
