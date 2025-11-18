class Wbackup < Formula
  version "0.0.9"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-amd64.tar.gz"
      sha256 "1de1e1dbb96d4c9bcfd12415f86616e297046326fa4313309f716de0f05abd6d"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-arm64.tar.gz"
      sha256 "0d9c5428eef095d68a9e76f3237b4144b0713afd65fa8f6d33a90115ea20d978"
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
