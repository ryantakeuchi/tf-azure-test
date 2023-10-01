variable subscription_id {
  type = string
  description = "Azure Subscription ID"
}

variable tenant_id {
  type = string
  description = "Azure Tenant ID"
}

variable client_id {
  type = string
  description = "Azure Service Principal appId"
}

variable client_secret {
  type = string
  description = "Azure Service Principal password"
}

resource "random_id" "digits" {
  byte_length = 8
}

prefix = "${random_id.digits.hex}"