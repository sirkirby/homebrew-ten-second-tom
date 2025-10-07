class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.1.0-beta.4.tar.gz"
  version "0.1.0-beta.4"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.1.0-beta.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "567b23bf6794304bab1870c84e5ccbfe6b8bd0549d162b8179d59a8b85ef262b"
    sha256 cellar: :any_skip_relocation, sequoia: "d8a17dcf4e108c202d4bf79c27ec943c4c1af533a038e9abe1f221e5385c33ae"
  end

  def install
    bin.install "tom"
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
