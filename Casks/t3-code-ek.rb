cask "t3-code-ek" do
  version "0.0.45-ek.12"

  on_arm do
    sha256 "777799c044074c1d4e6180b59ff5b6239127d7af31a51d73d04149fce9c9892e"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "2eb8bdabca7fe9a5fb6bde4f5fdfe6d38e736e4ef97520bbd74aa46673207f2f"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-x64.dmg"
  end

  name "T3 Code EK"
  desc "Desktop app for AI-assisted coding"
  homepage "https://github.com/e-kotov/t3code"

  auto_updates true
  depends_on macos: :ventura

  app "T3 Code EK.app"
end
