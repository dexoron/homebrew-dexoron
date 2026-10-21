class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.9.5"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.5/dcr-x86_64-apple-darwin-0.9.5"
      sha256 "e7c9fe66c6b5975e94937d1bd9d6ece91417fce0777c59a3d84e02dafa018eb9"
    end

    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.5/dcr-aarch64-apple-darwin-0.9.5"
      sha256 "a6bf11b9a7c6948a2d5e6fc2194dd522e1b7170bce45c2bb68904324d6f516ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.5/dcr-x86_64-unknown-linux-gnu-0.9.5"
      sha256 "4958e0ea0435e26cca0f1b098387d902f16b0af3024689b7222cca51feb996bf"
    end

    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.5/dcr-aarch64-unknown-linux-gnu-0.9.5"
      sha256 "f4190a9a553efdc3038cb86fb5e5ab0483daa6f778fbe0834e0ac317ce4a9ad4"
    end
  end

  resource "man-pages" do
    url "https://github.com/dexoron/dcr/releases/download/v0.9.5/dcr-man-pages-0.9.5.tar.gz"
    sha256 "5406331b48e7edc61c3f5da2ebdeca72c27e82c411eaa8823a7fc943958fb1e9"
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
