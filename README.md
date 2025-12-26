# AWS EC2 + S3 (Terraform – Production Ready)

## 📌 Objective
Provision an Ubuntu EC2 instance in an **existing AWS network**
with secure access to an S3 bucket using **IAM roles**, following
industry best practices.

---

## 🏗️ What This Project Creates
- Ubuntu EC2 instance
- S3 bucket
- IAM role & policy (EC2 → S3 access)

---

## 🔍 What This Project Uses (No Hardcoding)
- Existing VPC (lookup by tag)
- Existing Subnet (lookup by tag)
- Existing Key Pair
- Latest Ubuntu AMI (dynamic)

---

## 🔐 Security Best Practices
- No access keys on EC2
- IAM role-based access
- Least privilege
- Dynamic resource discovery

---

## 📋 Prerequisites
- Terraform >= 1.5
- AWS CLI configured
- Existing:
  - VPC (tagged)
  - Subnet (tagged)
  - EC2 key pair

---

## 🚀 Deployment Steps

```bash
terraform init
terraform validate
terraform plan
terraform apply
