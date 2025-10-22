class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "10c6a14bdf35fe0184102354cf463453493d9e786662af33f2df8255753282c7"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9b3043b3d87eeebc26d1b0dc75e412b004ce7596e5b7a8b391551baac73c5f86"
    sha256 cellar: :any_skip_relocation, sequoia:       "a0f054374e8e8d819e8e9405a0a5469478c0a65e0233270e2e69a23ec2baadc6"
  end

  # Dependencies for voice entry feature
  depends_on "ffmpeg"

  def install
    bin.install "tom"
  end

  def caveats
    <<~EOS
      Voice Entry Setup (Optional):

      For local transcription (privacy-focused, offline):
        1. Install whisper.cpp: brew install whisper-cpp
        2. Download model to default location (base.en, 142 MB):
           mkdir -p ~/.cache/whisper
           curl -L -o ~/.cache/whisper/ggml-base.en.bin \\
             https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.en.bin
        3. Done! Tom looks for the model at ~/.cache/whisper/ggml-base.en.bin by default

      OR use OpenAI transcription (requires API key, no local setup):
        tom today --voice --stt=openai

      Legal: Ten Second Tom is designed for single-user personal use on your own
      device. Recording conversations may require consent in your jurisdiction.

      Storage: Audio recordings use ~4.7MB per 5-minute recording (16kHz mono WAV).
    EOS
  end

  test do
    system "#{bin}/tom", "--version"
  end
end
