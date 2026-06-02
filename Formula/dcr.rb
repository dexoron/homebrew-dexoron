class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.7.1"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "28a1458ec670d7e572b488f92a87eb32d7a14fcfae0b61291978d7967fac152f"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "957573dbfd96a784ba942e879ee9cffdfcafb3e8df630f7f081e6a35ce1a0b73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "61121ba58fa8db601dc6ef28d8c6584cbeb9a342199290450990a941f562c411"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "d9c9688787dbf101fe0e45fc0a8e56d9ebbf88ed9406e305f363130d4308a326"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  test do
    system "#{bin}/dcr", "--version"
  end
end
