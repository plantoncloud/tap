class ProjectPlanton < Formula
  version "v0.0.5"
  desc "ProjectPlanton: Multi-Cloud Unified Resource Model (MERM)"
  homepage "https://project-planton.io"
  os_arch = `arch`
  arch = (os_arch.include? "arm64")? "arm64" : "amd64"
  url "https://storage.googleapis.com/project-planton-downloads/cli/#{version}/project-planton-#{version}-#{arch}"
  def install
    os_arch = `arch`
    arch = (os_arch.include? "arm64")? "arm64" : "amd64"
    binary_name="project-planton-#{version}-#{arch}"
    bin.install "#{binary_name}"
    mv bin/"#{binary_name}", bin/"project-planton"
  end
end
