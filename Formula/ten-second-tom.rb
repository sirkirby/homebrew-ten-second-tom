class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "6ac1c7699e4d4ba229acf32019b99ab6625f341c3f1fb677a441d8434f7f7926"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "664e4a125dbd3976c04e6d9ce1b01c8da17d3e7f828e27e8df7d05f4a37ddbf2"
    sha256 cellar: :any_skip_relocation, sequoia:       "821342ed2803663af1d9f9381cbf9a6a29e3b78af2e5afb43b162914a77f3f87"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
