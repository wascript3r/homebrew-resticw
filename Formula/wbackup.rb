class Wbackup < Formula
  version "0.0.2"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-amd64.tar.gz"
      sha256 "2e4377affd2da7bdac6f3a8853e57c4a19e56dbde77e03fd3d2a2bd5b62d658a"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-arm64.tar.gz"
      sha256 "2dbe483247eade67e2d24b53de285acb7b78f13a3a5b921432a71dea3f7ab5b2"
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
