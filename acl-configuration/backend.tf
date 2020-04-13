data "terraform_remote_state" "cloud-nomadaclbootstrap" {
  backend = "remote"

  config = {
    organization = "burkey"
    workspaces = {
      name = "cloud-nomad-aclconfiguration"
    }
  }
}