class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "60c2e4aa86ea51a3040cbc237f13d53fd57e467013381e526af3fc69b12d512c"
  license "MIT"

  # Dependencies for voice entry feature
  depends_on "ffmpeg"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5f2015837d1a95128ff1fb438363941302805e74771d3f4ed91c71d2b0039c0d"
    sha256 cellar: :any_skip_relocation, sequoia:       "ed9ba0f89e44c14d89483dbd81583d1cb1a23c401be5c7ec00205399079d3bac"
  end

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
