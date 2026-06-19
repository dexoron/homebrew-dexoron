class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.7.4"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "2c328e5603c63fdfb85aca3a7f6b220b820f6f96a7e876a6bca550de8f86f622"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "42e8ce281448061158539c08ec0d68e1e4d4d22556740cbadff734f4c4082e5d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "7c27ef04c3fb529447de2cceaa20220a1e8724965904989f490584b87f632766"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "7a3821a640d09be0dcc9c621abb7da27e65ca00cfadbaa6802886676c577ef49"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  resource "man-pages" do
    url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-man-pages-#{version}.tar.gz"
    sha256 "c7d284b2409c365b00a07c9a9212507e600cb8c37029cd9a2fd4456801171fd1"
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
