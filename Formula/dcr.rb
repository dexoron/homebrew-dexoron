class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.6.8"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "2f4a8ef225c663dea8b47e646451851b800222986b1c16077b17939ddd32db03"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "826a4c0e41aba6974047b4a928709dc5d445cfcaaa79ae736b93b3541a8cd392"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "03d9fb1ddeaeccdd973df5756f4f15de23d537dd17f676cb817f0956b25bd3d5"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "f0d028969ee0e10e32bc95bab75b2b43527e85e5f68a024601cc45a45282a879"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  test do
    system "#{bin}/dcr", "--version"
  end
end
