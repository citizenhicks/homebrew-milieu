class Milieu < Formula
  desc "E2EE dotenv sync with repo branches"
  homepage "https://milieu.sh"
  head "https://github.com/citizenhicks/milieu.git", branch: "main"
  license "MIT"

  bottle do
    root_url "https://github.com/citizenhicks/milieu/releases/download/v0.2.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "661f746f954ac6a0b54b528782dccd18d6cf615f616a598ef47a181d295bd77a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "87bac5da9d75aeee18abc13fe3737ec68e728834f903fa26abbcf10f937ea07d"
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
