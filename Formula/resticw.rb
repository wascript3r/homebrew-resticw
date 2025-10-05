class Resticw < Formula
  version "0.0.9"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-amd64.tar.gz"
      sha256 "f91c3c20e4d58ceeab0010531bc9184beef2ca11ae85394896034c75c10219da"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-arm64.tar.gz"
      sha256 "8a1dce5269b5052e141f55102dcadc85a172b16138bcf8dba8d0ebe730ef06ff"
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
