class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.0-beta.6.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.0-beta.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e1607ee311b9f7a1486527d02d0e06e4dc5a5cf924c8f1f4e1769eefb9e78992"
    sha256 cellar: :any_skip_relocation, sequoia:     "f97ded60fd57520e4f8dfb5f9fbafe9eab6d4a2c6e75e881a360eca59c275777"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
