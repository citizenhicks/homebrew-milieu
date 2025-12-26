class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  url "https://github.com/citizenhicks/milieu/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "d6013cf1a0fb5cb95fefae2dc46f79414734fd0c58384a02fb15cf8f869fccb1"
  license "MIT"
  version "0.3.0"
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
