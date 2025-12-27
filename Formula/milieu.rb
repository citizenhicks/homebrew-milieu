class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  url "https://github.com/citizenhicks/milieu/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6e1142595f7eba05e1b44a776f8d7339649d46e78b6d61ac62659adf399f1580"
  license "MIT"
  version "0.4.0"
  head "https://github.com/citizenhicks/milieu.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--manifest-path", "crates/milieu/Cargo.toml"
    bin.install "target/release/milieu"
  end

  test do
    system "#{bin}/milieu", "--version"
  end
end
