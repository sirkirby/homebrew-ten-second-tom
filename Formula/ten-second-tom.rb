class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "6c7a936a5713a60af7cfd9a12b709a1bf22e4e9ba69f93170fed53ec80ea5c3d"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.8.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3a548d2b76ef98ed8847634d8b0be7175efcb3635656fe11ce5bf1fab537470b"
    sha256 cellar: :any_skip_relocation, sequoia:       "696294b0c0e40bcab898eeabd5b94a44bd275b213ea297ac7e16bd2b0949dbe8"
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
