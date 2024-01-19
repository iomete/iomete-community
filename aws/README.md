# iomete-community
Community Version of IOMETE Data-Plane

## Terraform

Reference: https://registry.terraform.io/modules/iomete/data-plane-aws/aws/2.1.1

1. Update values in terraform
2. Run terraform

```shell
terraform init
terraform plan
terraform apply
```

3. Update `data-plane-values.yaml` with the values from secret in kubernetes
4. Run 
   
```shell
chmod +x install.sh

./install.sh
```