# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

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

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibliy in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag

We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag

Specify their values in a variable definitions file

```
terraform apply -var-file="testing.tfvars"
```

[Terraform Variables Definitions](https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence)

### terraform.tfvars

This is the default file to load in terraform variables in blunk

[Terraform Variables Definitions](https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence)

### auto.tfvars

This file can contain variable values that are automatically loaded by Terraform, without the need for explicitly specifying the -var-file flag. 

[Terraform Variables files](https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence)

### order of terraform variables

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

Environment variables
The terraform.tfvars file, if present.
The terraform.tfvars.json file, if present.
Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

[Terraform Variable Definition Precedence](https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence)