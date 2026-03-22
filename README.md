## Technical Description

This repository contains infrastructure-as-code (IaC) for deploying Google Cloud Platform (GCP) resources using Terraform/OpenTofu. It is designed to integrate with Atlantis, a pull request automation tool that runs Terraform plan and apply commands directly from pull requests.

### Infrastructure Components

- **Terraform Configuration**: Uses OpenTofu v1.11.5 with the HashiCorp Google provider (v7.24.0) and google-beta provider for managing GCP resources
- **GCS Bucket**: Provisions a Google Cloud Storage bucket (`my-test-bucket-atlantis`) with configurable location
- **Backend**: Uses GCS backend for remote state storage with bucket `atlantis-demo-tfstates` and state prefix `my-app-infra-state`
- **Labels**: All resources are tagged with default labels (`terraform: true`, `app: my-app-infra`)

### Project Structure

- `my-app-infra/main.tf` - Terraform configuration with provider setup and backend configuration
- `my-app-infra/buckets.tf` - GCS bucket resource definition
- `my-app-infra/variables.tf` - Variable definitions (project ID, region, location)
- `my-app-infra/default.tfvars` - Default variable values
- `my-app-infra/versions.tf` - Terraform version and provider requirements
- `atlantis.yaml` - Atlantis workflow configuration

### Atlantis Integration

The repository is configured with two workflows:

- **only_default**: For the default workspace with `default.tfvars` file
- **workspaces**: For multi-environment deployments using workspace-specific variable files (e.g., `${WORKSPACE}.tfvars`)

Key configuration:
- Auto-planning enabled on changes to `*.tf`, `*.tfvars`, and `files/**`
- Requires PR approval and mergeable status for apply
- Uses OpenTofu instead of Terraform
- Validates formatting with `tofu fmt`

### Pre-commnit hooks

- Hooks on root directory: `yaml` cheks and empty line at end.
- Hooks with projects dir: running `terraform fmt` check and `terraform validation` check.

[Pre-commit installation](https://pre-commit.com/#install).

Or on mac you can install the pre-commit with `brew install pre-commit`.
