# Egor Kotov's Homebrew Tap

This repository contains Homebrew formulas and casks for various tools and applications developed by Egor Kotov.

## JumpCut

Instant macOS Spaces switching: replaces the slow desktop-slide animation of a three-finger horizontal trackpad swipe with a near-instant native transition. Experimental; primary target is macOS 27 on Apple Silicon.

```bash
brew install --cask e-kotov/tap/jumpcut
```

The cask installs the Apple Development-signed release, verifies the pinned code signature, and clears the quarantine attribute. After the first launch, grant JumpCut Accessibility permission in System Settings. More info at the [main repository](https://github.com/e-kotov/JumpCut).

---

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

The fork's release workflow updates this cask to each published `vX.Y.Z-ek.N`
prerelease, using a write deploy key on this repository. Upgrading stays manual.
Apple Silicon only (no Intel builds). Mac builds are not notarized; the cask re-signs the app ad hoc after install.
