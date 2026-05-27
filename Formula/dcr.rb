class Dcr < Formula
  desc "Cargo-like utility to manage C/C++ projects"
  homepage "https://dcr.dexoron.su"
  version "0.6.8"

  on_macos do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-apple-darwin-#{version}"
      sha256 "b19fcab763b98e8efdc36bf6be6ac3917e1da59550580d7c40aff95cb96056ff"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-apple-darwin-#{version}"
      sha256 "db3666a42c5ab9d66dbc7c23410529472e24234fbc46205a339ac2ada2343993"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-x86_64-unknown-linux-gnu-#{version}"
      sha256 "4a606c1df82767da0a71afbd820e90d6690fe45ede37a2ef60de8b51b8538874"
    end
    on_arm do
      url "https://github.com/dexoron/dcr/releases/download/v#{version}/dcr-aarch64-unknown-linux-gnu-#{version}"
      sha256 "57a9d46adf8ac412fee3069a80fd50e94b478a0273f4f2ac618a654adde94a71"
    end
  end

  def install
    bin.install Dir["dcr*"].first => "dcr"
  end

  test do
    system "#{bin}/dcr", "--version"
  end
end
