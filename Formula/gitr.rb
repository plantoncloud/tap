class Gitr < Formula
  version "v1.0.1"
  desc "gitr: git rapid - save time(a ton) by opening git repos on web right from the command line"
  homepage "https://github.com/plantoncloud/gitr"
  os_arch = `arch`
  arch = (os_arch.include? "arm64")? "arm64" : "amd64"
  url "https://storage.googleapis.com/gitr-downloads/#{version}/gitr-#{version}-#{arch}"
  def install
    os_arch = `arch`
    arch = (os_arch.include? "arm64")? "arm64" : "amd64"
    binary_name="gitr-#{version}-#{arch}"
    bin.install "#{binary_name}"
    mv bin/"#{binary_name}", bin/"gitr"
  end
end

