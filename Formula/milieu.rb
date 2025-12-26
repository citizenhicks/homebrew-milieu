class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  url "https://github.com/citizenhicks/milieu/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "7089a6aaf668cd6d2832e1064d56a3b8f97275cd599c82fa7fce78ad4b1335c7"
  license "MIT"
  version "0.3.2"
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
