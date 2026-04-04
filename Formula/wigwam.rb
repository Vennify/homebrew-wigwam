class Wigwam < Formula
  desc "Access terminal sessions from the browser"
  homepage "https://github.com/Vennify/wigwam-releases"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.4.0/wigwam_darwin_arm64.tar.gz"
      sha256 "dadf4081fcaefc177ba8613f5f2721455850a37635b543de295c559bfa268dfe"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.4.0/wigwam_darwin_amd64.tar.gz"
      sha256 "5d374ca76e6c44256d671901febeda1d0ee6feeae13c6e7d97b74a209e3827b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.4.0/wigwam_linux_arm64.tar.gz"
      sha256 "7dbcf22f0885828d3833561a04ca9eb7a0adb303a2ff1bc54dc1604c3f39ebee"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.4.0/wigwam_linux_amd64.tar.gz"
      sha256 "4c59344875e720a9c5ed091696d4b2b647845175be137e4a990af977a1eb6012"
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
