class Resticw < Formula
  version "0.0.12"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-amd64.tar.gz"
      sha256 "a50c69f67fa3f9338015d7609ed2408320a69dd1f7096b67c2d92b1ec656a319"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-arm64.tar.gz"
      sha256 "91d2c6032c2be41204e6865aa708d8b114d1dd4acc05a1df4b2ee874bb70b4f2"
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
