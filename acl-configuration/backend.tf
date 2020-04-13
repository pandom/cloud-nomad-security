data "terraform_remote_state" "cloud-nomad-aclbootstrap" {
  backend = "remote"

  config = {
    organization = "burkey"
    workspaces = {
      name = "cloud-nomad-aclbootstrap"
    }
  }
}