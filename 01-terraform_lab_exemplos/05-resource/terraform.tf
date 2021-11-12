terraform {
  backend "remote" {
    organization = "brunopassi"

    workspaces {
      name = "workspace-brunopassi"
    }
  }
}
