variable "name" {}
variable "children" {}

module "dir" {
  source = "./"
  for_each = { for file in local.root_filesystem : file.name => file if file.type == "dir" }

  name = each.key
  children = each.value.children
}

module "file" {
  source = "../file"
  for_each = { for file in local.root_filesystem : file.name => file if file.type == "file" }

  name = each.key
  contents = each.value.contents
}
