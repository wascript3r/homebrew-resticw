class Wbackup < Formula
  version "0.0.4"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-amd64.tar.gz"
      sha256 "2658d5a12999645757f05b2371ef5a64d8792da3a01054304008ae8fc3a999df"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-wbackup/releases/download/v#{version}/wbackup-darwin-arm64.tar.gz"
      sha256 "2ca9a7ebba40dfefebe109c851fd80d10ffccdc1aa2e5f140a1747a793d62fab"
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
