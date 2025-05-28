provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "myterraformec2-keypair"  
  public_key = file("~/.ssh/id_rsa.pub") 
}

resource "aws_instance" "example" {
    ami = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name

    tags = {
        Name = "Terraform-EC2-Instance"
    }
}
