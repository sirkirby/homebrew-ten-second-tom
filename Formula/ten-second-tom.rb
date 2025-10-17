class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "48723eca22086a84c20939c124b08c4f0f11d4f7591b4fcc1ea40edf9617eb99"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "664762ee9199563fde5d113c2114e10afb40d55a009ba6e6cd8d023b90eba739"
    sha256 cellar: :any_skip_relocation, sequoia:       "c68fdb3a86ee03c9fb124af777186d9e431fb59a157b7e10ce41d035348806e6"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
