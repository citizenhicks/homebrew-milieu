class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  url "https://github.com/citizenhicks/milieu/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "bbe61475464ec90bd3dd0d98008c967d1f33285b8b743927f149dbecb788f729"
  license "MIT"
  version "0.3.1"
  head "https://github.com/citizenhicks/milieu.git", branch: "main"

  bottle do
    root_url "https://github.com/citizenhicks/milieu/releases/download/v0.3.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f2e96bba51cc92ef6e88cb8f331c178a0b83ffad0d4aa3b09784732b856228cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "13c0b9bba647c80cd1471594370ed140bc0cc63eca8838969ab47eaf9fc910cc"
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
