class TailscaleProxyApp < Formula
  desc "Standalone userspace egress proxy for Tailscale exit nodes (no root required). It exposes a local HTTP/SOCKS5 proxy that routes traffic through any of your tailnet's exit nodes."
  homepage "https://github.com/e-kotov/tailscale-proxy-app"
  license "BSD-3-Clause"
  version "0.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.0.2/tailscale-proxy-app_0.0.2_macOS_arm64.tar.gz"
      sha256 "8bfaa7134a0222954d683b969f41ace2040efabf9e6b2ea984861e7b256f4c45"
    else
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.0.2/tailscale-proxy-app_0.0.2_macOS_x86_64.tar.gz"
      sha256 "3870e83ae52d9816e649756e5e8f8fae787e44591793d576727e8304ab8c874d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.0.2/tailscale-proxy-app_0.0.2_linux_arm64.tar.gz"
      sha256 "41005dc93c00c90e56d74d075df88cfb01cba87a65f174dc68e076c03b13346d"
    else
      url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.0.2/tailscale-proxy-app_0.0.2_linux_x86_64.tar.gz"
      sha256 "2097df45a0ba0112387d4a24e688fbcbcd5d0804862051baaaa54535a92bf265"
    end
  end

  def install
    bin.install "tailscale-proxy-app"
  end

  test do
    system "#{bin}/tailscale-proxy-app --version"
  end
end
