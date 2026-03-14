class Wigwam < Formula
  desc "Access tmux sessions from the browser"
  homepage "https://github.com/Vennify/wigwam-releases"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.1.0/wigwam_darwin_arm64.tar.gz"
      sha256 "59d81f7e822e5368fc57b4183ee7fb89a34588dbb2ff8825eda22b48d6b6a7e5"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.1.0/wigwam_darwin_amd64.tar.gz"
      sha256 "82ffc3f914f4ee581aa7b4e814d52f2441d11acd111449c0f60865e6f7d423a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.1.0/wigwam_linux_arm64.tar.gz"
      sha256 "b0b6a4071f27fd292aaa379248d28e75ec4afdcb3c82922656e0c5361095d9bf"
    else
      url "https://github.com/Vennify/wigwam-releases/releases/download/v0.1.0/wigwam_linux_amd64.tar.gz"
      sha256 "5b71217f2eebf3b5df1fdddb6c960b0b675fc1aa072b8f6074488bacaa259dd7"
    end
  end

  def install
    bin.install "wigwam"
  end

  def caveats
    <<~EOS
      Quick setup:

        wigwam setup              # install tmux-resurrect + continuum (session safety)
        wigwam service install    # run as a background service (auto-start on login)
        wigwam login              # connect to relay for remote/mobile access
        wigwam hooks install --all  # push notifications for Claude Code, Cursor, etc.

      Then open https://wigwam.build/session in your browser,
      or download the Wigwam app for iOS / Android.
    EOS
  end
end
