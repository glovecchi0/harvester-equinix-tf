# How to create resources

- Copy `./terraform.tfvars.example` to `./terraform.tfvars`
- Edit `./terraform.tfvars`
  - Update the required variables:
    -  `prefix` to give the resources an identifiable name (eg, your initials or first name)
    -  `project_name` to identify the project in your Equinix account <- **otherwise you can export the `TF_VAR_project_name` or `TF_VAR_project_id` variable**
    -  `metro` to suit your Region
    -  `api_key` to access your Equinix account <- **otherwise you can export the `METAL_AUTH_TOKEN` or `TF_VAR_api_key` variable**
    -  `vm_namespace` to specify the namespace where the VMs will be placed
    -  `ssh_password` to specify the password used for SSH login to Harvester's Virtual Machines
- Make sure you are logged into your Equinix Account from your local Terminal. See the preparatory steps [here](../../README.md).

#### Optionally the user can also provide:

`TF_VAR_metal_create_project` Terraform variable to create a project of name `TF_VAR_project_name` if it does not exist.

#### Terraform Apply (Infrastructure only)
```bash
terraform init -upgrade && terraform apply -auto-approve
```

#### Terraform Apply (Infrastructure + Virtual Machines)
```bash
terraform init -upgrade && terraform apply -auto-approve && sed -i '' 's|/\*|#/\*|g; s|\*/|#\*/|g' main.tf outputs.tf && terraform init -upgrade && terraform apply -auto-approve
```

#### Terraform Destroy (Infrastructure only)
```bash
terraform destroy -auto-approve
```

#### Terraform Destroy (Infrastructure + Virtual Machines)
```bash
terraform destroy -auto-approve && sed -i '' 's/#//g' main.tf outputs.tf
```

#### OpenTofu Apply (Infrastructure only)
```bash
tofu init -upgrade && tofu apply -auto-approve
```

#### OpenTofu Apply (Infrastructure + Virtual Machines)
```bash
tofu init -upgrade && tofu apply -auto-approve && sed -i '' 's|/\*|#/\*|g; s|\*/|#\*/|g' main.tf outputs.tf && tofu init -upgrade && tofu apply -auto-approve
```

#### OpenTofu Destroy (Infrastructure only)
```bash
tofu destroy -auto-approve
```

#### OpenTofu Destroy (Infrastructure + Virtual Machines)
```bash
tofu destroy -auto-approve && sed -i '' 's/#//g' main.tf outputs.tf
```

## How to access Equinix instances

#### Add your PUBLIC SSH Key to your Equinix profile (Click at the top right > My Profile > SSH Keys > + Add New Key)

#### Run the following command

```bash
ssh -oStrictHostKeyChecking=no -i <PREFIX>-ssh_private_key.pem rancher@<PUBLIC_IPV4>
```

## How to access Harvester VMs

#### Install virtctl

##### macOS installation and setup

```bash
export VERSION=v0.54.0
wget https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/virtctl-${VERSION}-darwin-amd64
mv virtctl-v0.54.0-darwin-amd64 virtctl
chmod +x virtctl
sudo mv virtctl /usr/local/bin/
virtctl version
```

#### Run the following command

```bash
export KUBECONFIG=<PREFIX>_kube_config.yml
kubectl -n <VM_NAMESPACE> get vmi
virtctl ssh --local-ssh=true <SSH_USERNAME>@vmi/<VM_NAME>.<VM_NAMESPACE>
```
