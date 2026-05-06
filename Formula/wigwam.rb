class Wigwam < Formula
  desc "Access terminal sessions from the browser"
  homepage "https://github.com/Vennify/wigwam-releases"
  version "0.2.0-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.2.0-beta/wigwam_darwin_arm64.tar.gz"
      sha256 "066442aa61e2ebb528b8186a3bae52b6c4fe4f4bb2691e2e9213cf8c25749c34"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.2.0-beta/wigwam_darwin_amd64.tar.gz"
      sha256 "4c3ff9f07587279e4f31aef4886cccaeab4548fae5fc164fe4b200a6c959e33d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.2.0-beta/wigwam_linux_arm64.tar.gz"
      sha256 "547f6c7ede2822b3ccb961914e8e6b7f439a442c675336eaa98d42d2751f0c1d"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.2.0-beta/wigwam_linux_amd64.tar.gz"
      sha256 "82d6de5e68b47c4f4197fe860fb0e59b022621e4382d456cecb004646e6cc6ca"
    end
  end

  def install
    bin.install "wigwam"
    bin.install_symlink "wigwam" => "ww"
    bin.install_symlink "wigwam" => "wwx"
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
