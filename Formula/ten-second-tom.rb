class TenSecondTom < Formula
  desc "CLI tool for daily work summaries using Claude AI with voice entry support"
  homepage "https://github.com/sirkirby/ten-second-tom"
  url "https://github.com/sirkirby/ten-second-tom/archive/refs/tags/v0.8.7.tar.gz"
  sha256 "cbb6c820cf8443f69325731b66a51c4eb22cb7cfd0c140f217de1b086e4a9ffa"
  license "MIT"

  # Bottles (pre-built binaries) for fast installation
  bottle do
    root_url "https://github.com/sirkirby/ten-second-tom/releases/download/v0.8.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ddd46f4231bb70a7b50b840577b37156d43e0826040f1bc60e6ee3e36ccd782b"
    sha256 cellar: :any_skip_relocation, sequoia:       "4acd22b05bd265cf773cf7a89a9a7af927623bca19108df6cad2da7c01367bda"
  end

  # Dependencies for voice entry feature
  depends_on "ffmpeg"

  def install
    bin.install "tom"

    # Install native macOS extension for notifications
    if OS.mac?
      prefix.install "TenSecondTom.Extensions.MacOS.app"
    end
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
