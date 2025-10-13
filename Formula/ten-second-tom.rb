class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "77a9d2968348b3a1522f078cc75e3f82807cda3e1bb05aff5fab64f0f3605a58"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "09f05627159e342663597a29b9e437244a3605c4d9c5bde9a0e9f38060f2d2b1"
    sha256 cellar: :any_skip_relocation, sequoia:       "b5e4d2218416daed9477f5a91eec1c768eb53a0857c733f0b917118dd26e87df"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
