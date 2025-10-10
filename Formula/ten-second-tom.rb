class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "e0d7f4d35441ab451afec9d24137212e04fe66a6e8d4f2149270a33989e943f2"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "296ca85671da1e35f7e93c04c52a006dedbe64d0524206c42b89658e334e967a"
    sha256 cellar: :any_skip_relocation, sequoia:       "7180e45c65f15f7848a3ca156620a3d72c153240c77ca70ccc6ccb11e4e7b686"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
