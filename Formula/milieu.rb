class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  url "https://github.com/citizenhicks/milieu/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "bbe61475464ec90bd3dd0d98008c967d1f33285b8b743927f149dbecb788f729"
  license "MIT"
  version "0.3.1"
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
