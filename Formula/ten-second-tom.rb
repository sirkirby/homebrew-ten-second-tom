class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4729da00e1889d7b83a107c4cdb66fd6bf273f4d1d6df947d05dd9dc87cfb596"
    sha256 cellar: :any_skip_relocation, sequoia:       "0251b9cd62606f9d2e23e2ed6da3962a922de3288b3f75fd5dcea6661a0b7166"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
