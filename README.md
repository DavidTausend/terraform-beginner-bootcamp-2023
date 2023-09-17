# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This Project is going utilize semantic versioning for its tagging.
[semver.org](https://semver.org)

The general format: 

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Tarrform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.

[Install Terrform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distrubtion

This project is built against Ubuntu.
Please consider checking your Linux Diestrution and change accordingly to distrubtion needs.

[How To Check OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS Version:
```sh
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring into Bash Scripts

while fixing the Terraform CLI gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So We decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This allow us an easier to debug and execute manually Terraform CLI.
- This will allow better portablity for other project that need to install Terraform CLI.

#### Nala use instead apt

Nala is a front-end for libapt-pkg and use the interface of python-apt api.
While using the **apt** command could be hard to understand what apt is trying to do when installing or upgrading.

- Easy to understand, than apt.
- Not showing some redundant messages.
- Formatting the packages better.
- Use color to show specifically what will happen with a package during install, removal, or an upgrade.

[Install Nala](https://gitlab.com/volian/nala)

Example how to install nala:
```bash
sudo apt install nala
```

#### Script response for installation program

While the installation from some programs ask for `Do you want to continue? [Y/n]` and pause the installation. Therefore, we added `-y` to the installation command to do an automatical flag yes.

Example: 
```sh
sudo nala install terraform -y
```

#### Shebang 

A Shebang (prounced Sha-bang) tells the bash script what program that will interpet the script. eg. `#!//bin/bash`

ChatGPT recommended this format for bash: `#!/usr/bin/env bash`

- For portability for different OS distributions.
- Will search the user's PATH for the bash executable.
- Interpreter in the current environment.

https://en.wikipedia.org/wiki/Shebang_(Unix)

### Execution Considerations

When executing the bash script we can use the `./`` shorthand notiation to execute the bash script.

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script to a program to interpert it.

eg. source ``./bin/install_terraform_cli`


#### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permission for the fix to be exetuable at the user mode.

´´´sh
chmod u+x ./bin/install_terraform_cli
´´´

alternatively:

´´´sh
chmod 744 ./bin/install_terraform_cli
´´´

https://en.wikipedia.org/wiki/Chmod


### Gitpod Lifecycle

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks

### Working Env Vars

We can list out all Enviroment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can set using export `HELLO='world``

In the terrminal we unset using `unset HELLO``

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```

Within a bash script we can set env without writing export eg.

´´´sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
´´´

#### Printing Vars

We can print an env var using echo eg. `echo $HELLO``

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

´´´sh
gp env HELLO='world'
´´´

All future workspaces launched will set the env vars for all bash terminals opened in thoes workspaces.

You can also set en vars in the ´.gitpod.yml´ but this can only contain non-senstive env vars.

### AWS CLI Installation

AWS CLI is installed for the project via the bash script `./bin/install_aws_cli`

[Getting Started Install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) [AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following AWS CLI command:

```sh
aws sts get-caller-identity
```

If it is succesful you should see a json payload return that looks like this:

```sh
{
    "UserId": "AIDATURQK35UC4TW6ENRV",
    "Account": "777777777777",
    "Arn": "arn:aws:iam::777777777777:user/terraform-beginner-bootcamp"
}
```

We'll need to generate AWS CLI credits from IAM User in order to the user AWS CLI.