terraform init \
    -backend-config="storage_account_name=<your_storage_account_name>" \
    -backend-config="access_key=<your_storage_account_access_key>" \
    -backend-config="container_name=dataopstfbackend" \
    -backend-config="key=test.terraform.tfstate"
