cask "t3-code-ek" do
  version "0.1.3-ek.10"
  sha256 "0e6dba3315b0f325a21197191aac338a7fc8e59364dc6e56a2c7f38a975b1a41"

  # Apple Silicon only; the fork publishes no Intel builds.
  url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  name "T3 Code EK"
  desc "Desktop app for AI-assisted coding"
  homepage "https://github.com/e-kotov/t3code"

  # Fork releases are prereleases tagged vX.Y.Z-ek.N; the fork also carries
  # upstream's tags, which must not count as cask versions.
  livecheck do
    url "https://github.com/e-kotov/t3code.git"
    regex(/^v?(\d+(?:\.\d+)+-ek\.\d+)$/i)
    strategy :git
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "T3 Code EK.app"

  # Personal fork builds are ad-hoc signed and not notarized. Re-seal the app
  # after installation, then remove only its quarantine flag so Gatekeeper
  # does not block this known release on this Mac.
  postflight_steps do
    run "/usr/bin/codesign",
        args: [
          "--force",
          "--deep",
          "--sign",
          "-",
          "--timestamp=none",
          "{{appdir}}/T3 Code EK.app",
        ]
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/T3 Code EK.app"]
  end
end
