cask "jumpcut" do
  version "0.1.0"
  sha256 "b0d761173153ae5c642b88b3a446f0756ae32f1c8d59e9d0ff136fc181a06eb4"

  url "https://github.com/e-kotov/JumpCut/releases/download/v#{version}/JumpCut-#{version}-arm64.zip"
  name "JumpCut"
  desc "Instant macOS Spaces switching via three-finger trackpad swipes"
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
