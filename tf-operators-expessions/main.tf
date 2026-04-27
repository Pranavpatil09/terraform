terraform {
  
}

#Number list variable

variable "num_list" {
  type = list(number)
  default = [ 1,2,3,4,5 ]
}

#object list of persons

variable "Object_list" {
  type = list(object({
    fname = string
    lname = string
  }))
  default = [ {
    fname = Pranav
    lname = Patil
  },
  {
    fname = Vaish 
    lname = Chaugule
  }]
}

variable "map_list" {
  type = map(number)
  default = {
    "one" = 1,
    "two" = 2,
    "three" = 3,
    "four" = 4,
    "five" = 5
  }
}


#calculations

locals {
  mul = 2 * 8
  add = 2 + 8
  sub = 8 - 2
  div = 8 / 2   

  #double the number list
  double_num_list = [ for num in var.num_list : num * 2 ]

  #odd numbers from the number list
  odd_num_list = [ for num in var.num_list : num if num % 2 != 1 ]

  #to get only person with fname   
  fname_list = [ for person in var.Object_list : person.fname ]

#work with map list

  #to get only values from the map list
  map_info = [ for key, value in var.map_list : value * 5]

  double_map_info = [ for key, value in var.map_list : value * 2]
}

output "output" {
  value = local.double_map_info
}