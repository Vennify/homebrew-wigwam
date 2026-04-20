class Wigwam < Formula
  desc "Access terminal sessions from the browser"
  homepage "https://github.com/Vennify/wigwam-releases"
  version "0.1.0-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.1.0-beta/wigwam_darwin_arm64.tar.gz"
      sha256 "d78850a46c025c3fecda764f7feca24526bea072d54ffdceede86f072b30cb63"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.1.0-beta/wigwam_darwin_amd64.tar.gz"
      sha256 "f7efc9e05c817c16fc5644e812a0f95247346b3a73e3a9429a164978f0b7d75e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.1.0-beta/wigwam_linux_arm64.tar.gz"
      sha256 "e1a99636adb9bdf30b812934e88e7972b620a229e323a3a8a2eb25d51e99d703"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.1.0-beta/wigwam_linux_amd64.tar.gz"
      sha256 "45b82cf6f22be675e6c3f81d386927ec8e0142e190125d754ddde575905b3634"
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
