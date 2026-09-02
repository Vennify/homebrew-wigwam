class Wigwam < Formula
  desc "Access terminal sessions from the browser"
  homepage "https://github.com/Vennify/wigwam-releases"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.wigwam.build/hut/v0.5.0/wigwam_darwin_arm64.tar.gz"
      sha256 "d811fdcca9c40e7f3a9de6932da7ac624c2455901add7c35f9dcd27dfd046eed"
    else
      url "https://releases.wigwam.build/hut/v0.5.0/wigwam_darwin_amd64.tar.gz"
      sha256 "f9aa8f7a818a51b1b6052b1d9d48a634a280136bc8a8aaec6e36f0469a54ac3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.wigwam.build/hut/v0.5.0/wigwam_linux_arm64.tar.gz"
      sha256 "95f0969b270c51403d65dc382d032e59a5d6c8ab682684ab948dd58cc1771d38"
    else
      url "https://releases.wigwam.build/hut/v0.5.0/wigwam_linux_amd64.tar.gz"
      sha256 "acbd36262ef5241f100a96a95ba9e34b1c2da3143d1170a6adbe73f33b8f2b67"
    end
  end

  def install
    bin.install "wigwam"
    bin.install_symlink "wigwam" => "ww"
    bin.install_symlink "wigwam" => "wwx"
    bin.install_symlink "wigwam" => "wigwam-codex"
  end

  def caveats
    <<~EOS
      Quick setup:

        wigwam setup              # configure session persistence
        wigwam service install    # run as a background service (auto-start on login)
        wigwam login              # connect to relay for remote/mobile access
        wigwam hooks install --all  # push notifications for Claude Code, Cursor, etc.

      Then open https://wigwam.build/session in your browser,
      or download the Wigwam app for iOS / Android.
    EOS
  end
end
