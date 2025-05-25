# Multi-Cloud Terraform Automation with PowerShell

### Introduction
Modern organizations increasingly rely on multi-cloud strategies to enhance flexibility, avoid vendor lock-in, and optimize performance and cost. However, managing infrastructure across multiple cloud providers can be complex.

This project aims to automate the provisioning of virtual machines (VMs) on AWS, GCP, and Azure using a unified PowerShell script and modular Terraform configuration, enabling seamless, repeatable, and user-friendly deployment.

### Objectives
Automate VM provisioning across AWS, GCP, and Azure.

Enable users to select the cloud provider interactively.

Use a single script to dynamically execute Terraform workflows.

Maintain modularity using per-provider directories.

Ensure repeatable infrastructure deployments and clean teardowns.


### Tools And Services

| Tool/Service   | Purpose                                 |
| -------------- | --------------------------------------- |
| **Terraform**  | Infrastructure as Code (IaC) tool       |
| **PowerShell** | Automation scripting on Windows         |
| **AWS CLI**    | Authenticate and manage AWS resources   |
| **Azure CLI**  | Authenticate and manage Azure resources |
| **GCP SDK**    | Authenticate and manage GCP resources   |
| **Git**        | Version control and code collaboration  |


## Project Overview

- ✅ Choose your cloud provider interactively via PowerShell.
- ✅ Dynamically pass cloud-specific variables like region, instance name, and admin credentials (for Azure).
- ✅ Automatically run `terraform init`, `plan`, and `apply`.
- ✅ Supports automated resource teardown with `terraform destroy`.
- ✅ Clean and modular structure using separate provider directories.

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell) on Windows
- CLI Tools:
  - AWS: `aws configure`
  - GCP: `gcloud auth application-default login`
  - Azure: `az login`

---

## 📦 How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/Gaurii-01/Multi-cloud-with-terraform.git
   cd Multi-cloud-with-terraform

2. Run the PowerShell script:
   ```bash
   ./choose-provider.ps1

3. Follow on-screen prompts:

- Select your cloud provider.

- Enter region, instance name, and credentials (if required).

The script will:

- Create a terraform.tfvars file.

- Navigate to the correct provider directory.

- Run terraform init, plan, and apply.

4. To destroy resources:

- Re-run the script and select the destroy option when prompted.
---

## Screenshots
<img src="https://github.com/user-attachments/assets/e4919508-a90b-4d86-8095-746299edbb86" width="600"/>

-----------------------------------------------------------------------------------------------------------------------

<img src="https://github.com/user-attachments/assets/4135b6ac-dc83-4d70-b764-3f02e1a227a9" width="600"/>

------------------------------------------------------------------------------------------------------------------------

<img src="https://github.com/user-attachments/assets/bf67bb1d-ff73-40c5-bb5e-4d24b75b6a7b" width="600"/>

------------------------------------------------------------------------------------------------------------------------

<img src="https://github.com/user-attachments/assets/a13bfae5-95f2-4844-8bd2-d829d21b7420" width="600"/>

------------------------------------------------------------------------------------------------------------------------

## Destroying the Instance
<img src="https://github.com/user-attachments/assets/70a9a9e6-48fc-4ae2-9a8c-9f931e647c5b" width="600"/>

------------------------------------------------------------------------------------------------------------------------

<img src="https://github.com/user-attachments/assets/9459bc72-a6bd-47a7-bfb3-84a1503b7c4c" width="600"/>

------------------------------------------------------------------------------------------------------------------------







