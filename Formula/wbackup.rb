class Wbackup < Formula
  version "0.0.7"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-amd64.tar.gz"
      sha256 "4f99d36234ae0fa841c9d872267337804a09a3d9fb21846a4ca5aed2eddfc1d4"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-arm64.tar.gz"
      sha256 "be54b7d686ac478855a5df7f3c19d1ecad94714887c4d31746fd68ac533d0f6a"
    end
  end

  def install
    bin.install "wbackup"
    (etc/"wbackup").mkpath
    (var/"wbackup").mkpath
  end

  service do
    run [opt_bin/"wbackup", "-c", etc/"wbackup/config.json", "-s", var/"wbackup/state.json"]
    keep_alive true
    restart_delay 60
    working_dir var/"wbackup"
    error_log_path var/"log/wbackup.log"
    environment_variables PATH: "/usr/local/bin:#{std_service_path_env}"
  end
end
