class Wigwam < Formula
  desc "Access terminal sessions from the browser"
  homepage "https://github.com/Vennify/wigwam-releases"
  version "scode-v0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/vscode-v0.2.0/wigwam_darwin_arm64.tar.gz"
      sha256 "3380166be2465713ae21164f570ab327e45dde2ba75737096a1f56f179831231"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/vscode-v0.2.0/wigwam_darwin_amd64.tar.gz"
      sha256 "e81f5458931d7170346f6aee89d2fda17a3657fb2064798775043fd99038d7a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/vscode-v0.2.0/wigwam_linux_arm64.tar.gz"
      sha256 "f6deb222b3a709b96764c40eb51c4f64f53e347ac9938f718c6d5f789da66e3d"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/vscode-v0.2.0/wigwam_linux_amd64.tar.gz"
      sha256 "99980d4e1dd53ae7877468d9ec9b8688c542890fecc40f3b50fe864d83eee3b4"
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
