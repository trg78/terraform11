# terraform12

```
.tf files , public.     tf_vars must contain the entry information:
```


## Create file ~/aws_creds.txt :

```
export AWS_ACCESS_KEY_ID=""   - login
export AWS_SECRET_ACCESS_KEY=""   - password
export TF_VAR_region=us-east-2   -  your region
export TF_VAR_ami=ami-05c1fa8df71875112  - available ami from your region
```


## Then import envs from ~/aws_creds.txt :

```
source ~/aws_creds.txt
```



## Install AWS CLI version 2 locally :

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
aws --version

(It works on March 2020)
```


## Start infrastructure deployment or destroy it:

```
terraform init
terraform plan
terraform apply
terraform destroy
```
