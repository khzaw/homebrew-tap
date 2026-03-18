class Huex < Formula
  desc "Extract dominant colors from images"
  homepage "https://github.com/khzaw/huex"
  url "https://github.com/khzaw/huex/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "933a3d009a94d56289d7b06cc066fa3b71624e9d20fbf0d8ebc7613cf84dbea2"
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
