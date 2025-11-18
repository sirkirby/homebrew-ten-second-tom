class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "faf9635697ce99f5f96c303f696b3ba1dcfe2fdc35de46c08d64034c33f52a02"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.7.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2e63c46954ab8dcea577c33feb3b6e33585c04e70819f6b03e2427e2f24b4010"
    sha256 cellar: :any_skip_relocation, sequoia:       "25cb1a92e5a7c2ed9af4ff15cd4581a3085de3b20bddf53f09e3fe1a4886570f"
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
