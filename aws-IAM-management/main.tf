terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  users_data = yamldecode(file("./users.yaml")).users

  user_role_pairs = flatten([
    for user in local.users_data : [
      for role in user.roles : {
        username = user.username
        role     = role
      }
    ]
  ])
}

output "output" {
  value = local.user_role_pairs
}

resource "aws_iam_user" "user" {
    for_each = toset(local.users_data[*].username)
    
    name = each.value
}

resource "aws_iam_user_login_profile" "profile" {
    for_each = aws_iam_user.user

    user    = each.value.name
    password_length = 12 

lifecycle {
  ignore_changes = [ 
    password_length, 
    password_reset_required,
    pgp_key,
   ]
}
}

#attaching policies to users
resource "aws_iam_user_policy_attachment" "attachment" {
    for_each = { for pair in local.user_role_pairs : "${pair.username}-${pair.role}" => pair }

    user       = aws_iam_user.user[each.value.username].name
    policy_arn = "arn:aws:iam::aws:policy/${each.value.role}"
}