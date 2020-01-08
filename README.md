# tf-201
TF Templates from TF 201 course, tests. Follow-along repo

- Use the template_file provider
- Render an IAM policy from a template
- Understand real world scenarios for using
templates


# Templates 

See in-details template syntax : https://www.terraform.io/docs/configuration/expressions.html#string-templates


# Test

- Template is in file : [iam_policy.tpl.json](iam_policy.tpl.json)
- Main code in : [main.tf](main.tf)

## Steps 

- Init terraform : `terraform init` 
  Example output : 
    ```bash
    Initializing the backend...

    Initializing provider plugins...
    - Checking for available provider plugins...
    - Downloading plugin for provider "template" (hashicorp/template) 2.1.2...

    The following providers do not have any version constraints in configuration,
    so the latest version was installed.

    To prevent automatic upgrades to new major versions that may contain breaking
    changes, it is recommended to add version = "..." constraints to the
    corresponding provider blocks in configuration, with the constraint strings
    suggested below.

    * provider.template: version = "~> 2.1"

    Terraform has been successfully initialized!

    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.

    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
    ```
- Apply : ```terraform apply``` 
    Example output : 
    ```bash
    terraform apply
    
    data.template_file.iam_policy: Refreshing state...

    Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

    Outputs:
    ```

    ```json
    iam_policy = {
      "Version":"2012-10-17",
      "Statement":[
        {
            "Sid":"RestrictInstanceLifecycle",
            "Effect":"Allow",
            "Action":[
              "ec2:StartInstances",
              "ec2:StopInstances",
              "ec2:TerminateInstances"
            ],
            "Resource":[
              "arn:aws:ec2:us-west-2:1234567890:instance/*"
            ]
        }
      ]
    }
    ```