class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.7.1"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "bf73677b5a88031c677b0e1ed22791fa7e6acec84d33cbeab2cb1185bded5f1d"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "8559b69a2ddd4857fdaf809a34ba89bac4c000b2f5276667663b0ac1a13c3e08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "79be3af6568db369562edd66fac5a2e0455a98e70cccfd603a70601323779516"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "306ce3ae14734b5d9ba6ec14e98dab9578205024142540b187d39a6ecebf776d"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  resource "man-pages" do
    url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-man-pages-#{version}.tar.gz"
    sha256 "1384d67340a648056d9e37a9e5e41ece56b807a8ad630df84e0303bcb18d95bc"
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
