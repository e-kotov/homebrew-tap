# Egor Kotov's Homebrew Tap

This repository contains Homebrew formulas and casks for various tools and applications developed by Egor Kotov.

## Tailscale Proxy

Standalone userspace egress proxy for Tailscale exit nodes (no root required). It exposes a local HTTP/SOCKS5 proxy that routes traffic through any of your tailnet's exit nodes.

### 💻 CLI Version

Lightweight, CGO-free binary for terminal use.

```bash
brew install e-kotov/tap/tailscale-proxy
```

### 🖥️ Desktop Version (GUI)

Full cross-platform desktop application with status window and rich log viewer. Available for macOS, Linux, and Windows.

**macOS (Homebrew Cask):**

```bash
brew install --cask e-kotov/tap/tailscale-proxy-app
```

**Linux/Windows:** Download the binary or package from [Releases](https://github.com/e-kotov/tailscale-proxy-app/releases).

---
More info at the [main repository](https://github.com/e-kotov/tailscale-proxy-app)

## T3 Code EK

Install or update the macOS desktop app from the fork's GitHub releases:

```bash
brew install --cask e-kotov/tap/t3-code-ek
brew upgrade --cask t3-code-ek
```

The cask is versioned with each published T3 Code EK release. Mac builds are not notarized.
