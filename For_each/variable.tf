#region

variable "region" {
  description = "This will be the region"
  default     = "ap-south-1"
}

#VPC CIDR block

variable "VPC_CIDR_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "ec2_config" {
  description = "EC2 instance configuration"
  type = list(object({
    AMI_ID        = string
    INSTANCE_TYPE = string
  }))

}

variable "map" {
  description = "A map of key-value pairs"
    type = map(object({
        ami = string
        instance_type = string
    }) )
}