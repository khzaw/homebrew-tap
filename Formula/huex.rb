class Huex < Formula
  desc "Extract dominant colors from images"
  homepage "https://github.com/khzaw/huex"
  url "https://github.com/khzaw/huex/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "861e04f4d85384e08a96cd1a486e6c7193bb8178098b42cdfc143d483f19bbbe"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"tiny.ppm").write <<~EOS
      P3
      2 1
      255
      255 0 0   0 255 0
    EOS

    output = shell_output("#{bin}/huex --image tiny.ppm --json")
    assert_match "#FF0000", output
    assert_match "#00FF00", output
  end
end
