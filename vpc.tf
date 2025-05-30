module "vpc" {
	source			= "terraform-aws-modules/vpc/aws"
	version			= "~> 4.0"

	name			= local.name
	cidr 			= local.vpc_cidr
	availability_zones	= local.azs
	private_subnets		= local.private_subnets
	public_subnets 		= local.public_subnets
	intra_subnets		= local.intra_subnets
	enable_nat_gateway 	= true
	public_subnets_tags = {
		"kubernetes.io/role/elb" = 1
	}
	private_subnets_tags = {
		"kubernetes.io/role/internal-elb"=1
	}
}

