class Resticw < Formula
  version "0.0.5"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-amd64.tar.gz"
      sha256 "23f93ca820ddf9dc47be3c98d8338a9b04ae963cdaff1c7729e9c746d1b59cd7"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-arm64.tar.gz"
      sha256 "6a9aeb0b6674874c315eb277e579b446bd01298b1a46127b35ec0be333d458e6"
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
