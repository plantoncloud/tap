class ProjectPlanton < Formula
  version "v0.0.8"
  desc "ProjectPlanton: Multi-Cloud Unified Resource Model (MERM)"
  homepage "https://project-planton.io"
  os_arch = `arch`
  arch = (os_arch.include? "arm64")? "arm64" : "amd64"
  url "https://storage.googleapis.com/project-planton-downloads/cli/#{version}/project-planton-#{version}-#{arch}"
  kube_client_go_exec_plugins_version="v0.0.2"
  kube_client_gcp_credential_plugin_url="https://github.com/plantoncloud/kube-client-go-exec-plugins/releases/download/#{kube_client_go_exec_plugins_version}/kube-client-go-gcp-credential-exec-plugin-linux"
  
  def install
    os_arch = `arch`
    arch = (os_arch.include? "arm64")? "arm64" : "amd64"
    binary_name="project-planton-#{version}-#{arch}"
    
    # Install the main CLI binary
    bin.install "#{binary_name}"
    mv bin/"#{binary_name}", bin/"project-planton"
    
    # Download and install kube-client-go-gcp-exec-plugin
    system "curl", "-L", "#{kube_client_gcp_credential_plugin_url}", "-o", "kube-client-go-gcp-credential-exec-plugin-linux"
    system "chmod", "+x", "kube-client-go-gcp-credential-exec-plugin-linux"
    bin.install "kube-client-go-gcp-credential-exec-plugin-linux"
    mv bin/"kube-client-go-gcp-credential-exec-plugin-linux", bin/"kube-client-go-gcp-exec-plugin"
  end
end
