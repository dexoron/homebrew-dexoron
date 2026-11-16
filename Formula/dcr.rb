class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.9.6"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-x86_64-apple-darwin-0.9.6"
      sha256 "d74778b92c606ff79ef6a4a842db5a620add04eb85f9570e653b37a44a9e06c9"
    end

    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-aarch64-apple-darwin-0.9.6"
      sha256 "1930ca89609da65a0ec4c25ad424487b4465d6cccead1664ecd9220ce037e9fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-x86_64-unknown-linux-gnu-0.9.6"
      sha256 "c40d4af5ec855a56c3d251042fefbbd07ad372f8385a8e2dcc0355a5089d629c"
    end

    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-aarch64-unknown-linux-gnu-0.9.6"
      sha256 "0ec33de7ee148524c54a52be00ce35e787409e4a622579660d096e1d5958cdb4"
    end
  end

  resource "man-pages" do
    url "https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-man-pages-0.9.6.tar.gz"
    sha256 "30309879264ba6724cc8c31a16ea69946e77b959258f4f42de93e00a0fea62c5"
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
