class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.7.2"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "af0b57a020762e87611033412f904e25d37a119c6b175b8e81a2290b92ef27e8"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "26426a6dbd9ccdf58c83788bbc2470098d63b8d2a43e176887e4c2b2b024bc8c"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  resource "man-pages" do
    url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-man-pages-#{version}.tar.gz"
    sha256 "66fc70bf5c03960999e29c58e12f0e10b5af67287bdf20752e1390aa345c7b7a"
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
