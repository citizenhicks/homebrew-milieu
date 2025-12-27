class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  url "https://github.com/citizenhicks/milieu/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6e1142595f7eba05e1b44a776f8d7339649d46e78b6d61ac62659adf399f1580"
  license "MIT"
  version "0.4.0"
  head "https://github.com/citizenhicks/milieu.git", branch: "main"

  bottle do
    root_url "https://github.com/citizenhicks/milieu/releases/download/v0.4.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ecff438f471909c84424dd75e87da72700ab85263732ba1d6f0c88a79f0c8768"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d4553f8562452e681d3061316348ed61e2162a1c505b2ce06da1c3bc979dbf24"
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
