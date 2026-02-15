cask "tailscale-proxy-app" do
  version "0.1.0"

  on_intel do
    url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.0/tailscale-proxy-app_0.1.0_macOS_x86_64.tar.gz"
    sha256 "fd3f7df12c5f1130f6f39d97b89890816e54fd1c2dd83dbd5354e4d3d57d03c5"
  end

  on_arm do
    url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.0/tailscale-proxy-app_0.1.0_macOS_arm64.tar.gz"
    sha256 "134d9d458fa999a535d3a2a3a891c69f6a8c386e35b0db2af84258dede779236"
  end

  name "Tailscale Proxy App"
  desc "GUI proxy app for Tailscale exit nodes (no root required)"
  homepage "https://github.com/e-kotov/tailscale-proxy-app"

  binary "tailscale-proxy-app"

  zap trash: [
    "~/.config/tailscale-proxy-app",
  ]
end
