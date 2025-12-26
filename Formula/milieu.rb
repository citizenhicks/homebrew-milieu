class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  url "https://github.com/citizenhicks/milieu/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "d6013cf1a0fb5cb95fefae2dc46f79414734fd0c58384a02fb15cf8f869fccb1"
  license "MIT"
  version "0.3.0"
  head "https://github.com/citizenhicks/milieu.git", branch: "main"

  bottle do
    root_url "https://github.com/citizenhicks/milieu/releases/download/v0.3.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "cb1f2a957c872bee236b256342d86f2cb97f4b1ab724df8a0d52f1b0ea57a8b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "364eeb3a76cd4d156c24becfc120221161cea66a8ae605c59aea1bdd90037ee5"
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
