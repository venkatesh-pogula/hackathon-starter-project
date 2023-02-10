terraform {
      backend "s3" {
         bucket = "storage-ec2-s3"
         key    = "vpc_creation"
         region = "us-west-2"
         dynamodb_table = "my-dynamo-db"
  }
}