cask "t3-code-ek" do
  version "0.0.46-ek.3"

  on_arm do
    sha256 "c8dcfadc9649a095c98e3eef19ccb84925511ec524b46b8edbb487d40eae19cb"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "283505adf5f88903fafd93be13aae02af9f7e836e344888113b4aad4b88a23bf"

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
