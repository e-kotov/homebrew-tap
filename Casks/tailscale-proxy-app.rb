cask "tailscale-proxy-app" do
  version "0.1.2"

  on_intel do
    url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.2/tailscale-proxy-app_0.1.2_macOS_x86_64.tar.gz"
    sha256 "1366c466c938fb8a4cdbc19d57d704d42351d9b8968760507912fb88c9fd5c68"
  end

  on_arm do
    url "https://github.com/e-kotov/tailscale-proxy-app/releases/download/v0.1.2/tailscale-proxy-app_0.1.2_macOS_arm64.tar.gz"
    sha256 "225c7b69bdadf2dc1a07d7feb3194674ddb8bc452795b86076022155b4b761ab"
  end

  name "Tailscale Proxy App"
  desc "GUI proxy app for Tailscale exit nodes (no root required)"
  homepage "https://github.com/e-kotov/tailscale-proxy-app"

  binary "tailscale-proxy-app"

  zap trash: [
    "~/.config/tailscale-proxy-app",
  ]
end
