module.exports = {
    copy: function (terraform, answers) {
        var variables = {
            "variable": {
                CREATOR: {
                    type: "string",
                    description: "Creator of this deployment"
                },
                LOCATION: {
                    type: "string",
                    description: "Azure region to perform the deployment"
                },
                KUBERNETES_CLUSTER_NAME: {
                    type: "string",
                    description: "Name of Kubernetes cluster"
                },
                ADMIN_USER: {
                    type: "string",
                    description: "VM admin username"
                },
                SSH_KEY: {
                    type: "string",
                    description: "VM SSH Key"
                },
                KUBERNETES_VERSION: {
                    type: "string",
                    description: "Kubernetes version to deploy"
                },
                KUBERNETES_AGENT_COUNT: {
                    type: "string",
                    description: "Number of Kubernetes agents required"
                },
                KUBERNETES_VM_SIZE: {
                    type: "string",
                    description: "M size used for cluster"
                },
                OS_DISK_SIZE_GB: {
                    type: "number",
                    description: "Disk size of VMs"
                },
                KUBERNETES_CLIENT_ID: {
                    type: "string",
                    description: "Kubernetes client ID (from Azure AD Service Principal)"
                },
                KUBERNETES_CLIENT_SECRET: {
                    type: "string",
                    description: "Kubernetes client secret (from Azure AD Service Principal)"
                },
                RBAC_ENABLED: {
                    type: "bool",
                    description: "(Optional) Enable Kubernetes Role-Based Access Control. Defaults to true"
                },
                AUTO_SCALING_ENABLED: {
                    type: "bool",
                    description: `(Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to ${answers.autoScalingEnabled}.`,
                    default: answers.autoScalingEnabled
                },
                AUTO_SCALING_MIN_COUNT: {
                    type: "number",
                    description: `(Optional) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. Defaults to ${answers.minNodeCount}.`,
                    default: answers.minNodeCount
                },
                AUTO_SCALING_MAX_COUNT: {
                    type: "number",
                    description: `((Optional) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. Defaults to ${answers.maxNodeCount}.`,
                    default: answers.maxNodeCount
                }                
            }
        }

        if (!terraform.isDependency(answers.resourceGroup)) {
            variables.variable.AKS_RESOURCE_GROUP_NAME = {
                type: "string",
                description: ("(Required) The name of the resource group. Must be unique on your Azure subscription.")
            };
        }

        terraform.writeVariables(variables);
    }
}