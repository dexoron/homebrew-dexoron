class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.9.0"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-x86_64-apple-darwin-0.9.0"
      sha256 "393e3b2a39e992f74748f1b99b1a1d02a1f7a07d6819fe98b555c578d501e02e"
    end

    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-aarch64-apple-darwin-0.9.0"
      sha256 "885caf68e4c260f92051cadfe8adcdb57bda82c9c677a698ee78cc48b884a477"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-x86_64-unknown-linux-gnu-0.9.0"
      sha256 "8dbd3d1038ace2c6b3bc6f12d970df86e256809d259ab3940bdb357983a773ba"
    end

    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-aarch64-unknown-linux-gnu-0.9.0"
      sha256 "bc76bb5721ae1c805a7b25e54537c0900738946aeab9af1fdcf917b530c3ed0e"
    end
  end

  resource "man-pages" do
    url "https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-man-pages-0.9.0.tar.gz"
    sha256 "c4fefaa531b1f18318a33d87c7d5d1446a19a1fbd6d95c51c76138c32edc0426"
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
