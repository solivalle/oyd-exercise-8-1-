terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "media" {
  bucket = "${var.project}-${var.environment}-media"
}


resource "aws_sqs_queue" "jobs" {
  name = "${var.project}-${var.environment}-jobs"
}


module "iam" {
  source = "./infra/modules/iam"

  project       = var.project
  environment   = var.environment
  s3_bucket_arn = aws_s3_bucket.media.arn
  sqs_queue_arn = aws_sqs_queue.jobs.arn
}
