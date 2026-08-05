class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.8.4"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "4e1aba6f8e07528f527c32965f6c24c88fa29364918eb7f57ca813b3ad3cf39a"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "71eeb5c273e44e8e8d87614a0d1854607c415c9640f26c9e72448713a3a11a7b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "d35b50443249e67fd790cca3b4c1d076966f5b154a867a0be1d48c8a130346a9"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "fc75c888ae0eda21bcaf6128c7c69d4314c72e61e6d7c8f3a983f7eefe2041a2"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  resource "man-pages" do
    url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-man-pages-#{version}.tar.gz"
    sha256 "2d8c1b74c5fd2d811becb4524614544574345ccae06205fd03bec1aaec7c8344"
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
