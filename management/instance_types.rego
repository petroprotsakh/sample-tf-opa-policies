package terraform

import input.tfplan as tfplan


allowed_types = {
    "registry.terraform.io/hashicorp/aws": ["t2.nano", "t2.micro"],
    "registry.terraform.io/hashicorp/azurerm": ["Standard_A0", "Standard_A1"],
    "registry.terraform.io/hashicorp/google": ["n1-standard-1", "n1-standard-2"]
}


instance_type_key = {
    "registry.terraform.io/hashicorp/aws": "instance_type",
    "registry.terraform.io/hashicorp/azurerm": "vm_size",
    "registry.terraform.io/hashicorp/google": "machine_type"
}

array_contains(arr, elem) {
  arr[_] = elem
}

get_instance_type(resource) = instance_type {
    instance_type := resource.change.after[instance_type_key[resource.provider_name]]
}

deny[reason] {
    resource := tfplan.resource_changes[_]
    instance_type := get_instance_type(resource)
    not array_contains(allowed_types[resource.provider_name], instance_type)

    reason := sprintf(
        "%s: instance type %q is not allowed",
        [resource.address, instance_type]
    )
}
