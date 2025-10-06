class Resticw < Formula
  version "0.0.10"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-amd64.tar.gz"
      sha256 "2f5638dc9a6e096a4979729e643d42b92cf2af04a5b2784ec4561bd7cc248bd6"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-arm64.tar.gz"
      sha256 "0e8f656c2e65328287e9db7bd35f1536a4c7fa4fcd302558c349a0147516ef30"
    end
  end

  def install
    bin.install "resticw"
    (etc/"resticw").mkpath
    (var/"resticw").mkpath
  end

  service do
    run [opt_bin/"resticw", "-c", etc/"resticw/config.json", "-s", var/"resticw/state.json"]
    keep_alive true
    restart_delay 60
    working_dir var/"resticw"
    error_log_path var/"log/resticw-error.log"
    environment_variables PATH: "/usr/local/bin:#{std_service_path_env}"
  end
end
