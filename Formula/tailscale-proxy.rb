class TailscaleProxy < Formula
  desc "Lightweight CLI proxy for Tailscale exit nodes (no root required). Exposes a local HTTP/SOCKS5 proxy."
  homepage "https://github.com/e-kotov/tailscale-proxy-app"
  license "BSD-3-Clause"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.0/tailscale-proxy_0.1.0_macOS_arm64.tar.gz"
      sha256 "c523d76e01e2ea91438ddfb6c98904cd13943f6b5b1e8c0aebcd0a1241b5dd73"
    else
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.0/tailscale-proxy_0.1.0_macOS_x86_64.tar.gz"
      sha256 "0390ab6201fc42c61afb30cce9c926c5858d02480ec3ff0ea44c2c26832e56de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.0/tailscale-proxy_0.1.0_linux_arm64.tar.gz"
      sha256 "b1bd632764a1173ecfaeab549186fbfe5c40cdf6f09e3e3d091946e06b0af8b5"
    else
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.0/tailscale-proxy_0.1.0_linux_x86_64.tar.gz"
      sha256 "55c5dac29811b100f3b3dceaad5945466d31202c9b5c752c01f5e2899aacd844"
    end
  end

  def install
    bin.install "tailscale-proxy"
  end

  test do
    system "#{bin}/tailscale-proxy --version"
  end
end
