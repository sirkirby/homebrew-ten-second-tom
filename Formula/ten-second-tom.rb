class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.0-beta.10.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.0-beta.10"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d4e57d806fdb136f6ebe69df0cbe9df29f58f1354cfe60a75bb0fec375d65c7"
    sha256 cellar: :any_skip_relocation, sequoia:       "94490c495eca190859cc9486fcd994c2626e41d03f3ce9cf93b79f0af7973b19"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
