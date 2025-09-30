class Resticw < Formula
  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v0.0.2/resticw-darwin-amd64.tar.gz"
      sha256 "dad9f97499ba9dc3033c1b6b899d62f242c643b66693eb1a8550d653a023e4bf"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v0.0.2/resticw-darwin-arm64.tar.gz"
      sha256 "66afe5d4ee5d0da99766a4bb60c38ba76066992bd0f0dbc11870060f61ec673f"
    end
  end

  def install
    bin.install "resticw"
  end

  service do
    run [opt_bin/"resticw"]
    keep_alive true
    environment_variables PATH: "/usr/local/bin:#{std_service_path_env}"
    # working_dir var/"resticw"
    # log_path var/"log/myservice.log"
    # error_log_path var/"log/myservice-error.log"
  end
end
