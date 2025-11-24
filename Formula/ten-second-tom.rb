class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.8.9.tar.gz"
  sha256 "c74e18005f2be8f6971a2edfd76f4548e43ba0b54d231b3dfa1717ef5a1fb24c"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.8.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a48ec8d9be3906545d62b510252f07b2f6b1d3aa9c8bd8b8580c490e97ae1b8f"
    sha256 cellar: :any_skip_relocation, sequoia:       "001151273021b2527d1d424c17188e991b1d722bfa7b11a004c9704b07791870"
  end

  # Dependencies for voice entry feature
  depends_on "ffmpeg"

  def install
    bin.install "tom"
    # Install native macOS extension for notifications
    prefix.install "TenSecondTom.Extensions.MacOS.app" if OS.mac?
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
