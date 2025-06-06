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
        size              = 10
        tags = {
                 Name = "vol1"
        }
}

resource "aws_instance" "instance1" {
        ami = "ami-0953476d60561c955"
        instance_type = "t2.small"
        availability_zone = "us-east-1a"
        key_name = "Swanand_test"
        tags = {
        Name = "Amazon Instance"
}
}

resource "aws_volume_attachment" "ebs_att_1" {
        device_name = "/dev/sdh"
        volume_id   = aws_ebs_volume.myvol1.id
        instance_id = aws_instance.instance1.id
}
