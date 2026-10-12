cask "t3-code-ek" do
  version "0.0.45-ek.14"

  on_arm do
    sha256 "84312d5c33c80b45e60755e33dd29faf4156e41d9f5c77b52205e7195a9b5055"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "2d99dbf0676de414cca54c2557977213343580b8b24d8562ae0fb637593727b0"

    url "https://github.com/e-kotov/t3code/releases/download/v#{version}/T3-Code-#{version}-x64.dmg"
  end

  name "T3 Code EK"
  desc "Desktop app for AI-assisted coding"
  homepage "https://github.com/e-kotov/t3code"

  depends_on macos: :ventura

  app "T3 Code EK.app"
end
