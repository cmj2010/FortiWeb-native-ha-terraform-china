variable "fwb-byol-amis" {
  description = "FortiGate BYOL AMIs by region"
  type = "map"
  default = {
    "cn-north-1"      = "ami-0018086f102a145a9"
    "cn-northwest-1"   = "ami-007a8377ccfed6e36"
  }
}

variable "fwb-ond-amis" {
  description = "FortiGate On Demand AMIs by region"
  type = "map"
  default = {
    "cn-north-1"      = "ami-0018086f102a145a9"
    "cn-northwest-1"   = "ami-007a8377ccfed6e36"
  }
}
