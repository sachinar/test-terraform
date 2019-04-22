provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAJPUQCJCPZXHW33TQ"
  secret_key = "cqDes7ZYYw4MMZKYuRa0bLCgcjzNl+XNGQXRNrik"
}

resource "aws_instance"
"example" {
 ami = "ami-dd3442b2"
 instance_type = "t2.nano"
 subnet_id = "subnet-79cf2910"
 key_name   = "sachina"
 tags {
  Name = "CCInterview-Sachin"
 }
}

resource "aws_security_group" "CCInterview-Sachin" {
  name = "CCInterview-Sachin"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "test" {
  name = "ec2-instance-profile"
  role = "${aws_iam_role.CCInterview-sachin.name}"
  }

resource "aws_iam_role" "CCInterview-sachin" {
name = "CCInterview-sachin"
assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = "CCInterview-sachin"
policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1535346513440",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::cldcvr-interview/*"
    }
  ]
}
EOF
}
