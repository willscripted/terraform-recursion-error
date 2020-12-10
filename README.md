Hey!

I run into a `terraform init` error when using any self-referential module declaration:

```
module "dir" {
  source = "./"
  for_each = var.xyz
}
```

```
> terraform init

Initializing modules...

Error: Failed to remove local module cache

Terraform tried to remove
.terraform/modules/dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.dir.file
in order to reinstall this module, but encountered an error: unlinkat
```

This demo code runs out of the box:

```
git clone git@github.com:willscripted/terraform-recursion-error.git
make show
```

You can also open a shell session in the demo code using `make console`. 
Will require `make` and `docker`.


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
