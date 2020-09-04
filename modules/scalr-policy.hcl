version = "v1"

policy "pin_module_version" {
  enabled           = true
  enforcement_level = "hard-mandatory"
}

policy "required_modules" {
  enabled           = true
  enforcement_level = "advisory"
}
