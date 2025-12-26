class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  url "https://github.com/citizenhicks/milieu/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e77376ff7864a555f7fade5fac776859783571b145671e98ba052e55734b303c"
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
