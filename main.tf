locals {
  root_filesystem = [
    { name = "bin", type = "dir", children = []},
    { name = "etc", type = "dir", children = [
      { name = "hosts", type = "file", contents = "127.0.0.1 localhost" }   
    ]}
  ]
}

module "filetree" {
  source = "./dir"
  for_each = { for file in local.root_filesystem : file.name => file if file.type == "dir" }

  name = each.key
  children = each.value.children
}

