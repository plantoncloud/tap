class PlantonCli < Formula
  version "v0.0.44"
  desc "planton-cli: cli interface to interact with planton cloud service"
  homepage "https://planton.cloud"
  os_arch = `arch`
  arch = (os_arch.include? "arm64")? "arm64" : "amd64"
  url "https://storage.googleapis.com/planton-cli/#{version}/planton-cli-#{version}-#{arch}"
  def install
    os_arch = `arch`
    arch = (os_arch.include? "arm64")? "arm64" : "amd64"
    binary_name="planton-cli-#{version}-#{arch}"
    bin.install "#{binary_name}"
    mv bin/"#{binary_name}", bin/"planton"
  end
end

