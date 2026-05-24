cask "tailscale-proxy-app" do
  version "0.1.1"

  on_intel do
    url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.1/tailscale-proxy-app_0.1.1_macOS_x86_64.tar.gz"
    sha256 "665bc54d7453f23c2d2f9f492b2f7bb4493c7a7641c5e36bcdc6181012c627b1"
  end

  on_arm do
    url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.1/tailscale-proxy-app_0.1.1_macOS_arm64.tar.gz"
    sha256 "c131a4c76c36e8262626c8bf2f3d8c32f21bc37a029a3e416a05e56d8c9c770e"
  end

  name "Tailscale Proxy App"
  desc "GUI proxy app for Tailscale exit nodes (no root required)"
  homepage "https://github.com/e-kotov/tailscale-proxy-app"

  binary "tailscale-proxy-app"

  zap trash: [
    "~/.config/tailscale-proxy-app",
  ]
end
