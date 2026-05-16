

terraform/
│
├── modules/                # Reusable building blocks
│   ├── vpc/
│   ├── ec2/
│   ├── rds/
│   ├── s3/
│   └── iam/
│
├── environments/          # Environment-specific configs
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   │
│   ├── staging/
│   └── prod/
│
├── global/                # Shared infra (optional)
│   ├── s3-backend/
│   └── iam/
│
├── providers.tf
├── versions.tf
├── variables.tf
└── outputs.tf