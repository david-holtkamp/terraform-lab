module "postgres" {
  source        = "git::https://github.com/slalom-ggp/dataops-infra.git//catalog/aws/postgres?ref=main"
  name_prefix   = "${local.name_prefix}postgres-"
  environment   = module.env.environment
  resource_tags = local.resource_tags

  identifier          = "my-postgres-db"
  admin_username      = "postgresadmin"
  admin_password      = "asdf1234"
  skip_final_snapshot = true
}
output "postgres_summary" { value = module.postgres.summary }

module "redshift" {
  source        = "git::https://github.com/slalom-ggp/dataops-infra.git//catalog/aws/redshift?ref=main"
  name_prefix   = "${local.name_prefix}redshift-"
  environment   = module.env.environment
  resource_tags = local.resource_tags

  identifier          = "my-redshift-db"
  admin_username      = "redshiftadmin"
  admin_password      = "Asdf1234"
  skip_final_snapshot = true
}
output "redshift_summary" { value = module.redshift.summary }                                              
