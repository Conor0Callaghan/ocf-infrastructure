# create s3 bucket for application verions

resource "aws_s3_bucket" "eb_data_visualization" {
  bucket = "nowcasting-eb-applicationversion-data-visualization-${var.environment}"
  acl    = "private"
}

resource "aws_s3_bucket_object" "eb-object_data_visualization" {
  bucket = aws_s3_bucket.eb_data_visualization.id
  key    = "beanstalk/docker-compose-${var.docker_version}.yml"
  source = "${path.module}/docker-compose.yml"
}


