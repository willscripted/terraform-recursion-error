Hey!

This is the error I'm seeing trying to add a module that uses itself.

Module:

```
module "dir" {
  source = "./"
  for_each = { for file in local.root_filesystem : file.name => file if file.type == "dir" }

  name = each.key
  children = each.value.children
}
```


### 0.13.5 `terraform init`

```
> terraform init

Initializing modules...

Error: Failed to remove local module cache

Terraform tried to remove
.terraform/modules/dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir
in order to reinstall this module, but encountered an error: unlinkat
.terraform/modules/dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir:
file name too long


Error: Failed to remove local module cache

Terraform tried to remove
.terraform/modules/dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.file
in order to reinstall this module, but encountered an error: unlinkat
.terraform/modules/dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.file:
file name too long


{ .. clipped .. }
```

### 0.14.2 `terraform init`

```
> terraform init

Initializing modules...

Error: Failed to remove local module cache

Terraform tried to remove
.terraform/modules/dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir
in order to reinstall this module, but encountered an error: unlinkat
.terraform/modules/dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir:
file name too long


Error: Failed to remove local module cache

Terraform tried to remove
.terraform/modules/dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.file
in order to reinstall this module, but encountered an error: unlinkat
.terraform/modules/dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.file:
file name too long

{ .. clipped .. }
```
