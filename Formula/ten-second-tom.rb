class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "823a741ad11f4cc235bd533e3c3cd762f2e6661fe961f4f59408fe457c47b970"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "382c03900e1bf1e8647ca0e46a37317395357e0417d4f8d11df525156e314bc2"
    sha256 cellar: :any_skip_relocation, sequoia:       "e13379f34ce2356d73c66b37a9aea761104693a624948e3c771e4127dc80d236"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
