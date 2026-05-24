class TailscaleProxy < Formula
  desc "Lightweight CLI proxy for Tailscale exit nodes (no root required). Exposes a local HTTP/SOCKS5 proxy."
  homepage "https://github.com/e-kotov/tailscale-proxy-app"
  license "BSD-3-Clause"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.1/tailscale-proxy_0.1.1_macOS_arm64.tar.gz"
      sha256 "4f9bff24dc0ab391b3a3aae19b5b9da44303a2ca079d47d7581a7a3f97a26ec3"
    else
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.1/tailscale-proxy_0.1.1_macOS_x86_64.tar.gz"
      sha256 "f7a794a3d5ed7b829ba902679350c9cd50bfee7dfc3fd51beb56dc307488f14a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.1/tailscale-proxy_0.1.1_linux_arm64.tar.gz"
      sha256 "8d9850715822083f4fac869d8078359be95981cec92ab8965ba685e2eb8f9066"
    else
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.1/tailscale-proxy_0.1.1_linux_x86_64.tar.gz"
      sha256 "e375202ba6e22b305eba3d2d55f3c5b84acb596e63ccccc16663ab41be830cda"
    end
  end

  def install
    bin.install "tailscale-proxy"
  end

  test do
    system "#{bin}/tailscale-proxy --version"
  end
end
