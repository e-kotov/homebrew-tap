cask "t3-code-ek" do
  version "0.0.46-ek.2"

  on_arm do
    sha256 "b656899c5b50b50a88309ddf7842224b0002be79dcc6d62f6ad582c6d013d041"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ba56e7666f2db4f00ddb297a212b4f5e8c66866d80b6a16fd18fbc3c2b23607f"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-x64.dmg"
  end

  name "T3 Code EK"
  desc "Desktop app for AI-assisted coding"
  homepage "https://github.com/e-kotov/t3code"

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
