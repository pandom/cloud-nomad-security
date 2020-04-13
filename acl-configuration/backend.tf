data "terraform_remote_state" "cloud-nomad-aclconfiguration" {
  backend = "remote"

  config = {
    organization = "burkey"
    workspaces = {
      name = "cloud-nomad-aclconfiguration"
    }
  }
}