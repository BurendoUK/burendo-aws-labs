locals {
  vpc_cidr_block = "10.0.0.0/24"

  cidr_ranges = cidrsubnets(local.vpc_cidr_block, 2, 2, 2, 4, 4, 4)

  public_cidr_sets = {
    "1" : {
      "range" : local.cidr_ranges[0],
      "az" : data.aws_availability_zones.available.names[0]
    }
    "2" : {
      "range" : local.cidr_ranges[1],
      "az" : data.aws_availability_zones.available.names[1]
    }
    "3" : {
      "range" : local.cidr_ranges[2],
      "az" : data.aws_availability_zones.available.names[2]
    }
  }

  private_cidr_sets = {
    "1" : {
      "range" : local.cidr_ranges[3],
      "az" : data.aws_availability_zones.available.names[0]
    }
    "2" : {
      "range" : local.cidr_ranges[4],
      "az" : data.aws_availability_zones.available.names[1]
    }
    "3" : {
      "range" : local.cidr_ranges[5],
      "az" : data.aws_availability_zones.available.names[2]
    }
  }
}
