# RDS Subnet Group
resource "aws_db_subnet_group" "rds_sbng" {
  name       = "sbng-${var.tags.Environment}-rds"
  subnet_ids = var.subnet_ids

  depends_on = [
    aws_rds_cluster_instance.this
  ]

  tags = merge(
    {
      Name = "sbng-${var.tags.Environment}-rds"
      Type = "sbng"
    },
    var.tags
  )
}