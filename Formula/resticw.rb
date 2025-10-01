class Resticw < Formula
  version "0.0.4"

  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-amd64.tar.gz"
      sha256 "97d047799bac6ce755e97cb1f2e9a74b7890bf5ba03c43e21d65340dcb1f1c04"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v#{version}/resticw-darwin-arm64.tar.gz"
      sha256 "89ef73fabdd2bf3291b4d21d0aa2ed8417ad008d1365130f4c0e862410a55eec"
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
