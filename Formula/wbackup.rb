class Wbackup < Formula
  version "0.0.10"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-amd64.tar.gz"
      sha256 "bacc15c303b3de0b0df7aabee4baeacab4d2a0e511e6305c0b2641a260faa1bb"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-arm64.tar.gz"
      sha256 "cef40d45effcda65362ad429a6f9d682d643239c1909513f3e0c4a04e6767954"
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
