class May < Formula
  desc "personal productivity toolkit"
  homepage "https://github.com/0x6d6179/may"
  url "https://github.com/0x6d6179/may.git",
    tag:      "v0.1.10",
    revision: "2400af4a2690f5649c747c83c8193a9de2cbb805"
  license "MIT"

  head "https://github.com/0x6d6179/may.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/0x6d6179/may/internal/version.Version=#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"may", "./cmd/may"
  end

  def caveats
    <<~EOS
      run `may init` to configure may for your system.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/may --version")
  end
end
