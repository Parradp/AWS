resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = lower("AuroraCluster${var.project_name}")
  engine                  = "aurora-postgresql"
  engine_version          = var.dbp_engine_version
  database_name           = lower("Rds${var.project_name}")
  master_username         = var.dbp_username
  master_password         = var.dbp_password
  db_subnet_group_name    = var.dbp_subnetgroup
  availability_zones      = var.dbp_az
  vpc_security_group_ids  = var.dbp_security_group
  skip_final_snapshot     = true
  backup_retention_period = 7
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                = var.dbp_instance_count
  cluster_identifier   = aws_rds_cluster.postgresql.id
  identifier           = lower("Rds${var.project_name}${count.index}")
  instance_class       = var.dbp_instance_type
  engine               = aws_rds_cluster.postgresql.engine
  engine_version       = aws_rds_cluster.postgresql.engine_version
  db_subnet_group_name = var.dbp_subnetgroup
}