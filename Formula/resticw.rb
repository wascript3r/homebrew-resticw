class ResticW < Formula
  on_macos do
    on_arm do
      url "https://example.com/releases/download/v1.0.0/myservice-1.0.0-darwin-arm64.tar.gz"
      sha256 "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    end
    on_intel do
      url "https://example.com/releases/download/v1.0.0/myservice-1.0.0-darwin-amd64.tar.gz"
      sha256 "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    end
  end
