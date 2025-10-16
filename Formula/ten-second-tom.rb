class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "22ed559be4d09b77545eb8280bb673a3be077df971e836bfcb2deb34697d126e"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4ecbff07a5c8fd0e6417878b31e47fc07cd691b131c04c91b84763b709f56c14"
    sha256 cellar: :any_skip_relocation, sequoia:       "71a868e5f6ee6b3e164666b52fb8e03b4d25d44906db2c4a070c53988a714b7d"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
