class Wigwam < Formula
  desc "Access terminal sessions from the browser"
  homepage "https://github.com/Vennify/wigwam-releases"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.wigwam.build/hut/v0.5.1/wigwam_darwin_arm64.tar.gz"
      sha256 "17f1b8b99a9bbb937c797c6e1b9822932426df9c99da24969c2a007c378a98ad"
    else
      url "https://releases.wigwam.build/hut/v0.5.1/wigwam_darwin_amd64.tar.gz"
      sha256 "61c671513f60f1f9eb173aec11fc9cfd71cdf7211511e69764adec72fbd334d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://releases.wigwam.build/hut/v0.5.1/wigwam_linux_arm64.tar.gz"
      sha256 "5210e94901ffe4503efb00f595b62fee1b1046072c5bb0e4baee389c5db5697e"
    else
      url "https://releases.wigwam.build/hut/v0.5.1/wigwam_linux_amd64.tar.gz"
      sha256 "a9686a37ca7c7e83bc31831313316e26e3646e79002b68f35b72964b5fcb234c"
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
