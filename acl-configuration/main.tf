data "terraform_remote_state" "cloud-nomad" {
  backend = "remote"

  config = {
    organization = "burkey"
    workspaces = {
      name = "cloud-nomad"
    }
  }
}

locals {
    address = data.terraform_remote_state.cloud-nomad.outputs.addresses.nomad_ui
}
provider "nomad" {
  address = "http://burkey-iqzow1rgv8demlzy1-nomad-389122050.ap-southeast-2.elb.amazonaws.com:4646"
  region  = "ap-southeast-2"
}

resource "nomad_acl_policy" "appdev" {
  name        = "appdev"
  description = "Application Developer profile"
  rules_hcl   = "${file("${path.module}/policies/app-dev.policy.hcl")}"
}

resource "nomad_acl_policy" "prodops" {
  name        = "prodops"
  description = "Production Operations profile"
  rules_hcl   = "${file("${path.module}/policies/prod-ops.policy.hcl")}"
}

