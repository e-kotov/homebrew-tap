cask "jumpcut" do
  version "0.1.1"
  sha256 "79ae48ad8abf16ed9a80f00b9b9707a060ee9fea25dd062215f4f640b0c30c29"

  url "https://github.com/e-kotov/JumpCut/releases/download/v#{version}/JumpCut-#{version}-arm64.zip"
  name "JumpCut"
  desc "Instant macOS Spaces switching via four-finger trackpad swipes"
  homepage "https://github.com/e-kotov/JumpCut"

  livecheck do
    url "https://github.com/e-kotov/JumpCut.git"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :git
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "JumpCut.app"

  postflight_steps do
    # Preserve the release signature so Accessibility recognizes subsequent
    # updates signed by the same Apple Development identity.
    run "/usr/bin/codesign",
        args: [
          "--verify",
          "--deep",
          "--strict",
          "-R",
          '=identifier "dev.ekotov.jumpcut" and anchor apple generic and certificate leaf[subject.OU] = "2MC7X68AVT" and certificate leaf[field.1.2.840.113635.100.6.1.12] exists',
          "{{appdir}}/JumpCut.app",
        ]
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/JumpCut.app"]
  end
end
