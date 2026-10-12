cask "t3-code-ek" do
  version "0.0.45-ek.13"

  on_arm do
    sha256 "5ceaae0cc8bf6c0026f9164e359e6e7e8fbe37d6c7f586a73f755f9fcff9bb78"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "a410fb00df0e39cde883ac342eb1f03395215c3d9aabe7cdef7993d2f0b2ffbe"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-x64.dmg"
  end

  name "T3 Code EK"
  desc "Desktop app for AI-assisted coding"
  homepage "https://github.com/e-kotov/t3code"

  auto_updates true
  depends_on macos: :ventura

  app "T3 Code EK.app"
end
