class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "55091ef4f9d7efddabd7c9e7a58b45fe4d9e01110e691cb5cad962e39eb70dea"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0b08e810b833515c2db10c1a92907d6563cf9d5705f757356cf0ddf02a0857c1"
    sha256 cellar: :any_skip_relocation, sequoia:       "e779128a6a1a103367a885965fd3cc86783e977323460a941e96f56cd5e292d5"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
