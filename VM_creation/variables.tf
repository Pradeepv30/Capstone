# define GCP credentials
variable "gcp_auth_file" {
    type = string
    description = "GCP authentication file"
}

# define GCP project name
variable "project_name" {
    type = string
    description = "Project name"
}

# define GCP region
variable "gcp_region_1" {
    type = string
    description = "GCP region"
}

# define GCP zone
varibale "gcp_zone_1" {
    type = string
    description = "GCP zone"
}

# define GCP public subnet
variable "public_subnet_cidr_1" {
    type = string
    description = "GCP public subnet"
}