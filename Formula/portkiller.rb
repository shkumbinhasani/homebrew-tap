class Portkiller < Formula
  desc "Terminal UI that lists open TCP/UDP ports and lets you kill them"
  homepage "https://github.com/shkumbinhasani/portkiller"
  url "https://github.com/shkumbinhasani/portkiller/releases/download/v0.1.0/portkiller-macos-arm64.zip"
  sha256 "dc23260f6ce580b426a300af37382e6d0ea60dde86cc48e9361721d06e087bcc"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :monterey

  def install
    bin.install "portkiller"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/portkiller --version")
  end
end
