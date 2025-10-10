class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "e3ae2dac247e5b920e4ab799c42575cccb5fda6c19e0305eda287c49f70727ea"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3fb7d3dd330f69e661b7e5026d7e158f94f7bfec49fc6f6e223f8d034b974034"
    sha256 cellar: :any_skip_relocation, sequoia:       "cc59956de21a6b7c06532e87030980961684aa95e7a150d3aab04f4f01fd499d"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
