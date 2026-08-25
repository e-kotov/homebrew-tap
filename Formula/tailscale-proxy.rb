class TailscaleProxy < Formula
  desc "Lightweight CLI proxy for Tailscale exit nodes (no root required). Exposes a local HTTP/SOCKS5 proxy."
  homepage "https://github.com/e-kotov/tailscale-proxy-app"
  license "BSD-3-Clause"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.2/tailscale-proxy_0.1.2_macOS_arm64.tar.gz"
      sha256 "f2f5cd24185cda7813b91a694ee0bd24a59fd3b128a023ca5c6433d34846d06c"
    else
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.2/tailscale-proxy_0.1.2_macOS_x86_64.tar.gz"
      sha256 "90a33a1e9c87b5a8aa1f32468523bd35538c416ef08add02159b7cec5827885c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.2/tailscale-proxy_0.1.2_linux_arm64.tar.gz"
      sha256 "e94282fee1ddb4f18334fef2f6ac0fdb485080f224ea91536c219165986be627"
    else
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.2/tailscale-proxy_0.1.2_linux_x86_64.tar.gz"
      sha256 "e8a7c2de11a5cc4b5acd139b2781fec072caca11952f13406aaa6d1d99795262"
    end
  end

  def install
    bin.install "tailscale-proxy"
  end

  test do
    system "#{bin}/tailscale-proxy --version"
  end
end
