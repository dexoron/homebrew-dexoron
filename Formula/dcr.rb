class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.9.1"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-x86_64-apple-darwin-0.9.1"
      sha256 "d5b1a63e57f09c8cc0150336876b38e3adc7fdf3751d85b740cce46787db78bf"
    end

    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-aarch64-apple-darwin-0.9.1"
      sha256 "c0ecd6d0bbc8d79dc7df89c4397f0a8064017e9602e988b808b025169f5ebfd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-x86_64-unknown-linux-gnu-0.9.1"
      sha256 "65514809a95891306e4e2a659de74f335f1f4221c76a2c95573cdc71ab921b1d"
    end

    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-aarch64-unknown-linux-gnu-0.9.1"
      sha256 "f98466a1844e58b21511c0d0e86e48cf787c5fee68d018e6d2810427dc386ae9"
    end
  end

  resource "man-pages" do
    url "https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-man-pages-0.9.1.tar.gz"
    sha256 "4b98b0f698d274c611c91607098faef6d97a350e5b83580e165fad7551c52387"
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"

    resource("man-pages").stage do
      man1.install Dir["usr/share/man/man1/*.1"]
    end
  end

  test do
    system "#{bin}/dcr", "--version"
  end
end
