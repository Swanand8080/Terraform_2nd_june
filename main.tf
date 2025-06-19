terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}

resource "aws_ebs_volume" "myvol1" {
  availability_zone = "us-east-1a"
  size              = var.size
  tags = {
    Name = "${var.tag}-volume"
  }
}

resource "aws_ebs_volume" "myvol2" {
  availability_zone = "us-east-1a"
  size              = var.size
  tags = {
    Name = "${var.tag}-volume-1"
  }
}

resource "aws_instance" "instance1" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = "us-east-1a"
  key_name          = "Swanand_test"
  tags = {
    Name = "${var.tag}-instance-1"
  }
}

resource "aws_instance" "instance2" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = "us-east-1a"
  key_name          = "Swanand_test"
  tags = {
    Name = "${var.tag}-instance-1"
  }
}

resource "aws_volume_attachment" "ebs_att_1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myvol1.id
  instance_id = aws_instance.instance1.id
}
