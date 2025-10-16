class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "654b95a25671f0da5bf476b3f388539c922b084441f50acaac487359bd77b919"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "04c6f845a74b452bc855dfbf2fbd3b366fd07b209f803beee4874eb9ff227550"
    sha256 cellar: :any_skip_relocation, sequoia:       "74770f0751b39c36c1ceaf27963e0fe06c4a6622b8ef73b852836caab6a15a4f"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
