class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  url "https://github.com/citizenhicks/milieu/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "7089a6aaf668cd6d2832e1064d56a3b8f97275cd599c82fa7fce78ad4b1335c7"
  license "MIT"
  version "0.3.2"
  head "https://github.com/citizenhicks/milieu.git", branch: "main"

  bottle do
    root_url "https://github.com/citizenhicks/milieu/releases/download/v0.3.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3a98fd62aed641aaede7e745fe13c78754b0a3cb40df7d69c34baa542675853d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b68531577a73b54f791030cb31f89362406cf8270f26c2610ec3843dd2778c82"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--manifest-path", "crates/milieu/Cargo.toml"
    bin.install "target/release/milieu"
  end

  test do
    system "#{bin}/milieu", "--version"
  end
end
