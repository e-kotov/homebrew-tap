cask "t3-code-ek" do
  version "0.1.8-ek.202611060001"
  sha256 "857621f1469d60e60bb4564bb12228368fe808d34a87540a1eec317ed4f5d426"

  url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  name "T3 Code EK"
  desc "Desktop app for AI-assisted coding"
  homepage "https://github.com/e-kotov/t3code"

  livecheck do
    url "https://github.com/e-kotov/t3code.git"
    regex(/^v?(\d+(?:\.\d+)+-ek\.\d+)$/i)
    strategy :git
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "T3 Code EK.app"

  postflight_steps do
    # Preserve the release signature so Keychain recognizes subsequent updates.
    run "/usr/bin/codesign",
        args: [
          "--verify",
          "--deep",
          "--strict",
          "-R",
          '=identifier "pro.ekotov.t3code" and anchor apple generic and certificate leaf[subject.OU] = "2MC7X68AVT" and certificate leaf[field.1.2.840.113635.100.6.1.12] exists',
          "{{appdir}}/T3 Code EK.app",
        ]
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/T3 Code EK.app"]
  end
end
