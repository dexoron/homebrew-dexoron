class Dcr < Formula
  desc "DCR is a utility for managing C/C++ projects in a Cargo-like style."
  homepage "https://dcr.dexoron.su"
  version "0.6.7"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "bd508c73b5e0a9cd43f353fa60615f6790caea362c91b3e4499fc60cbaa3ead9"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "dc92e991d3b4796b74c3ad73f6af4578063d33413f65a18fcd91cd98cf880bd8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "19d138fd6d1f2b2c8ef838407f31dedc97b339f93c85ed45df64b9b499b9d45e"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "7d2a6629a09b53be544f5592e6bec3d22290546f2732f74b3b3d23a616d6a87a"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  test do
    system "#{bin}/dcr", "--version"
  end
end