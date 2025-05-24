# Set error action preference to stop script execution on non-terminating errors
$ErrorActionPreference = "Stop"

Write-Host "==========================="
Write-Host " Choose your cloud provider"
Write-Host "==========================="
Write-Host "1. AWS"
Write-Host "2. GCP"
Write-Host "3. Azure"
#Write-Host "4. DigitalOcean"

# Prompt user for cloud provider choice
$provider_choice = Read-Host "Enter choice [1-3]"

# Initialize variables for provider and region
$provider = ""
$region = ""
$instance_name = ""
$vars = ""

# Use a switch statement to set provider-specific variables
switch ($provider_choice) {
    "1" {
        $provider = "aws"
        $instance_name = Read-Host "Enter instance name"
	$region = Read-Host "Enter AWS region (e.g., ap-south-1)"
	$selected_ami = read-Host "Enter valid ami id for a Selected region (e.g., ami-0af9569868786b23a)"
        # Define Terraform variables for AWS
        $vars = @"
provider        = "$provider"
instance_name   = "$instance_name"
region          = "$region"
selected_ami 	= "$selected_ami"
"@
    }
    "2" {
        $provider = "gcp"
	$id_project = read-Host "Enter a valid Project ID of your GCP Console"
        $instance_name = Read-Host "Enter instance name"
	$instance_region = Read-Host "Enter GCP region (e.g., us-central1)"
	$instance_zone = Read-Host "Zone where the instance will be deployed (e.g., us-east1-b)"
	$name_image	= Read-Host "Enter valid Image name: e.g., ubuntu-os-cloud/ubuntu-2004-lts (Image_Project/Image_family)"
        # Define Terraform variables for GCP
        $vars = @"
provider        = "$provider"
id_project	= "$id_project"
instance_name   = "$instance_name"
instance_region = "$instance_region"
instance_zone   = "$instance_zone"
name_image	= "$name_image"
"@
    }
    "3" {
        $provider = "azure"
        $region = Read-Host "Enter Azure region (e.g., East US)"
        $instance_name = Read-Host "Enter instance name"
        $username = Read-Host "Enter admin username"
        $password = Read-Host "Enter admin password"
        # Define Terraform variables for Azure
        $vars = @"
provider        = "$provider"
region          = "$region"
instance_name   = "$instance_name"
admin_username  = "$username"
admin_password  = "$password"
"@
    }
# "4" {
#      $provider = "digitalocean"
#     $region = Read-Host "Enter DO region (e.g., nyc3)"
#    $instance_name = Read-Host "Enter instance name"
#   # Define Terraform variables for DigitalOcean
# $vars = @"
#provider        = "$provider"
#region          = "$region"
#instance_name   = "$instance_name"
#"@
 #   }
    default {
        Write-Host "Invalid option selected. Exiting."
        exit 1
    }
}

# Ask for action (apply or destroy)
$action = Read-Host "Enter action (apply/destroy)"
if ($action -ne "apply" -and $action -ne "destroy") {
    Write-Host "Invalid action. Please enter 'apply' or 'destroy'."
    exit 1
}

# Construct the path for the terraform.tfvars file
$tfvarsPath = "$PSScriptRoot/providers/$provider/terraform.tfvars"
# Write the generated variables to the tfvars file
$vars | Set-Content -Path $tfvarsPath
Write-Host "`nterraform.tfvars created at $tfvarsPath"

# Change the current directory to the selected provider's directory
Push-Location "$PSScriptRoot/providers/$provider"

# Run Terraform commands within a try-catch-finally block for error handling
try {
    Write-Host "`nRunning terraform init..."
    # Initialize Terraform
    terraform init

    # Conditional execution based on the chosen action
    if ($action -eq "apply") {
        Write-Host "`nRunning terraform plan..."
        # Run terraform plan
        terraform plan -var-file="terraform.tfvars"

        Write-Host "`nRunning terraform apply..."
        # Apply Terraform changes with auto-approval
        terraform apply -var-file="terraform.tfvars" -auto-approve

        # Check the exit code of the last command to determine success
        if ($LASTEXITCODE -eq 0) {
            Write-Host "`nInstance created successfully."
        } else {
            Write-Host "`nInstance creation may have failed. Check Terraform output for details."
        }
    } elseif ($action -eq "destroy") {
        Write-Host "`nRunning terraform destroy..."
        # Destroy Terraform resources with auto-approval
        terraform destroy -var-file="terraform.tfvars" -auto-approve

        # Check the exit code of the last command to determine success
        if ($LASTEXITCODE -eq 0) {
            Write-Host "`nResources destroyed successfully."
        } else {
            Write-Host "`nDestruction failed or partially succeeded. Check Terraform output for details."
        }
    }
}
catch {
    # Catch any errors that occur within the try block
    Write-Host "`nAn error occurred during Terraform execution: $($_.Exception.Message)"
    Write-Host "Error details: $($_.Exception | Format-List -Force)"
}
finally {
    # Always return to the original directory, regardless of success or failure
    Pop-Location
    Write-Host "`nOperation completed. Returned to original directory."
}
