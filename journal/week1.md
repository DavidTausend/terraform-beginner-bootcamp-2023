# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

```
PROJECT_ROOT
|
├── main.tf                # everything else.
├── variables.tf           # stores the structure of input variables
├── terraform.tfvars       # the data of variables we want to load into our Terraform project
├── providers.tf           # defined required providers and their configuration
├── outputs.tf             # stores our outputs
├── README.md              # required for root modules
├── sleep.tf               # time delay for actions
└── backend.tf             # store TF state file in S3
```

[Root Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
