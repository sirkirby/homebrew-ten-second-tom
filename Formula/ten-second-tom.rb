class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "10dc27c1a8317bc3e398fe9773e119d8a6941761462e312cb2094209219e4d26"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.2.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1e594f7db42c04441760c6649e208d6acad51c7aefd1abf1d86e1d65939d78b3"
    sha256 cellar: :any_skip_relocation, sequoia:       "fb2b67e233012aaa4e255a266b5a95a06269e3bb769da1cb5c0c0ce415433641"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
