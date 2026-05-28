class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.6.9"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "583ddb376029c32126ddfdf258d0a672394a6780b039963150553b88d11fc843"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "33105c515c5d73f6a392b4a898375a6a7a3922fa62c261670a7fad952d3719d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "2ad2315a01907a5baf4a5e655ef17d9510136b7abfa0525b455a6381ef5b1458"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "c820ef3ef085a56da2354efb9cb591ae9e384d4851e5fc058b2665f6e2f90ac9"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  test do
    system "#{bin}/dcr", "--version"
  end
end
