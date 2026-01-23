terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.4.0"
    }
  }
}

provider "aws" {}
provider "local" {}

resource "local_file" "example" {
  filename = "hello.txt"
  content  = "Hello from Terraform MCP"

  #  File permissions
  #file_permission      = "0644"
  # directory_permission = "0755"
}
