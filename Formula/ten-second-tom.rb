class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.0-beta.7.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.0-beta.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e53131aca88ec0dd38c3a9d90feb34d9c70e4b6fab00ec4ecc3860f44218eb79"
    sha256 cellar: :any_skip_relocation, sequoia:       "d3feb6b7337663f93846476eecd9fdb53f91fc29281a9a737c9d84926955ff90"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
