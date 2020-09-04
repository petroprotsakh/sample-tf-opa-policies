version = "v1"

policy "enforce_aws_resource" {
  enabled           = true
  enforcement_level = "hard-mandatory"
}

policy "enforce_aws_iam_and_workspace" {
  enabled           = true
  enforcement_level = "soft-mandatory"
}

policy "enforce_iam_instance_profiles" {
  enabled           = true
  enforcement_level = "soft-mandatory"
}

policy "enforce_kms_key_names" {
  enabled           = true
  enforcement_level = "soft-mandatory"
}

policy "enforce_s3_buckets_encryption" {
  enabled           = true
  enforcement_level = "soft-mandatory"
}
