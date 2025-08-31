- 
   ## FinServe DevSecOps Project (AZURE) – Documentation

    ### 1. Infrastructure Architecture

    - **Azure DevOps**: CI/CD orchestrator for Terraform (infrastructure) and Kubernetes (application) deployments.
    - **Terraform**: Modular, parameterized IaC for provisioning/updating resources in staging and production.
    - **Azure Cloud**: Target environment for all workloads.
    - **Virtual Network (VNet) & Subnet**: Network isolation and segmentation.
    - **Network Security Groups (NSGs)**: Enforce least-privilege ingress/egress.
    - **AKS Cluster**: Managed Kubernetes with RBAC for secure multi-tenancy.
    - **Linux VM**: Hosts legacy workloads not yet containerized.
    - **Azure Container Registry (ACR)**: Secure repository for validated container images.
    - **Sample App (NGINX/Hello World)**: Used for deployment validation.
    - **Azure Key Vault**: Secure secrets, keys, and certificates storage; no hardcoded secrets.

    ---

    ### 2. Pipeline Workflows

    **High-Level Workflow**

    - **Infrastructure Pipeline (Terraform Stage)**
        - Feature branches: Validate changes (`terraform fmt`, `validate`, `plan`).
        - Main branch: Apply infra changes to staging.
        - Release branch: Apply infra changes to production.

    - **Application Deployment Pipeline**
        - **Build**: Container image built and scanned (Trivy).
        - **Push**: Only passing images pushed to ACR.
        - **Deploy**: Helm/kubectl deploys to AKS.
        - **Validate**: Automated smoke tests for app reachability.

    - **Rollback / Cleanup**
        - On deployment failure: Rollback AKS to last successful version.
        - Optionally run `terraform destroy` in test environments.

    - **Branch Policies**
        - PR reviews required before merging to main/release.
        - Terraform plan and security scan reports reviewed in PRs.

    ---

    ### 3. Security Approach (DevSecOps)

    - **IaC Scanning**: Checkov detects Terraform misconfigurations in pipelines.
    - **Image Scanning**: Trivy scans container images before ACR push.
    - **VM Hardening**: Linux VM patched in pipeline.
    - **Secrets Management**:
        - All secrets stored in Azure Key Vault.
        - Pipelines access Key Vault via service principals; secrets not exposed in logs.
    - **Compliance Enforcement**: Hardcoded secrets/misconfigurations block pipeline.

    ---

    ### 4. Monitoring & Logging

    - **Azure Monitor + Container Insights**: Collects AKS metrics, pod health, and logs.
    - **Log Analytics Workspace**: Centralized AKS and VM logs.
    - **Alerts**:
        - Cluster/node failures
        - High pod crash loop rate
        - Security scan failures
