class Resticw < Formula
  on_macos do
    on_intel do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v0.0.1/resticw-darwin-amd64.tar.gz"
      sha256 "31e5841d007ac0b63feb9f2a3c5b8e9b375e21815a379c4bafc537a97b1ba20b"
    end
    on_arm do
      url "https://github.com/wascript3r/homebrew-resticw/releases/download/v0.0.1/resticw-darwin-arm64.tar.gz"
      sha256 "f1709cdbb14066953bd614852b8647dd590d0ffda03a02a6ce08c4504c3a213b"
    end
  end

  def install
    bin.install "resticw"
  end

  service do
    run [opt_bin/"resticw"]
    keep_alive true
    environment_variables PATH: "/usr/local/bin:#{std_service_path_env}"
    log_path var/"log/path-dump.log"
    # working_dir var/"resticw"
    # log_path var/"log/myservice.log"
    # error_log_path var/"log/myservice-error.log"
  end
end
