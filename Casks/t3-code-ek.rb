cask "t3-code-ek" do
  version "0.0.46-ek.4"

  on_arm do
    sha256 "484bc6f4f12e2ac40edd6d9711ad0625b49af254e4d5f2f0743eb175dc036cc6"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "f66fc6cc5ee8d2284aa95b40054b27372ef1d97d6ffc0027b1e247486c668b93"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-x64.dmg"
  end

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
