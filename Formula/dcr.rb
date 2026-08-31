class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.9.0"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "60094f797957a176ac8cc7eb5f7931137b7ea75b8581e3bfb84641b52de1b16f"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "edb4b562e84b799f3a1f8a3740b02368be9c6e433ede3f2601396297a97fdf24"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "d0de11a5c7d370109d50a482d95063930c120f3ace481a27ec3335efeb36e9b8"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "1f434f75d8748e639813fd45c1c1ec80c4e1124283d58a4e5d87f77d78d4facd"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  resource "man-pages" do
    url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-man-pages-#{version}.tar.gz"
    sha256 "0c91ba80f1f1d0a07da421a9d68b4869585810a3e6052881544ee5e7729bfc36"
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
