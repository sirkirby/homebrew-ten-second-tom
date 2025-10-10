class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "1f62317b044ab1fe5ef358eb2c4364d49688d550c4f6c6ac4da6a660218cd875"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d949d6cd69456d771f8f2287d86283ed5f8427e40bcdae2127de38c776d2f57a"
    sha256 cellar: :any_skip_relocation, sequoia:       "51740de7fb62163e008e6fe178262f5b2524370d290475640e6a8cf94c3dd82c"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
