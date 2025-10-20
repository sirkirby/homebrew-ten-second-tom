class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "4774280b43fc00fc15881f85c61f7355d8f19095feee9249b29673bbc38034c4"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3c39318a2274db572ff6259b025bf2a4d27346deba7904d3715423f07d288c30"
    sha256 cellar: :any_skip_relocation, sequoia:       "446199d9a49f3124c1b13951410ea74e4e0833917585a9722d90c5f8513f82cf"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
