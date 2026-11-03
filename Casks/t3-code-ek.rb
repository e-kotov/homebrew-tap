cask "t3-code-ek" do
  version "0.1.7-ek.202611030002"
  sha256 "e6b5476ea43bbde4ad81d49da86e60af1f2ce38e8240a3db70e39183b1f01fe7"

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
          '=identifier "pro.ekotov.t3code" and certificate root = H"6eea3d76ac584a617c48490ba138e98da1f4aa78"',
          "{{appdir}}/T3 Code EK.app",
        ]
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/T3 Code EK.app"]
  end
end
