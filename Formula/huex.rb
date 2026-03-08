class Huex < Formula
  desc "Extract dominant colors from images"
  homepage "https://github.com/khzaw/huex"
  url "https://github.com/khzaw/huex/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "62379d1b7125a84a6d6d6411af092556e6a5596d0f71f211b490d5986a393d8b"

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
