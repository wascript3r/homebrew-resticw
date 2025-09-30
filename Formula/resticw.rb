class Resticw < Formula
  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v0.0.1/resticw-darwin-amd64.tar.gz"
      sha256 "ce404a70a26d72770d4050f00ab31478e6f1676b43137ed40c17576babc624bd"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v0.0.1/resticw-darwin-arm64.tar.gz"
      sha256 "222a6eafdc39add63089b58aa0da792763a73fa79684740bcce9b0d8ca8c5bef"
    end
  end

  def install
    bin.install "resticw"
  end

  service do
    run [opt_bin/"resticw"]
    keep_alive true
    # working_dir var/"resticw"
    # log_path var/"log/myservice.log"
    # error_log_path var/"log/myservice-error.log"
    # environment_variables PATH: std_service_path_env
  end
end
