terraform {
required_version = ">= 1.3.0"
required_providers {
aws = {
source = "hashicorp/aws"
version = ">= 4.0"
}
}
}

provider "local" {}

resource "local_file" "example" {
  filename = "hello.txt"
  content  = "Hello from Terraform MCP"
}
