resource "aws_instance" "web" {
  
  ami           = "ami-0873b46c45c11058d"
  instance_type = "t2.large"
  associate_public_ip_address = "true"
  key_name      = "${aws_key_pair.Bastion-Key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  vpc_security_group_ids = ["${aws_security_group.allow_http_https.id}"]
  user_data     = "${file("userdata.sh")}"
  availability_zone = "us-west-2a"

}


#   associate_public_ip_address = "true"
  # key_name      = "${aws_key_pair.Bastion-Key.key_name}"
#   #user_data     = "${file("userdata.sh")}"
#   vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
#   availability_zone = "us-east-1a"


#     tags = {
#         Name = "HelloWorld"
#         Env = "Development"
#         Client = "panera_bread"
#         Team = "DevOps"
#         Created_by = "Farrukh"
#     }

# }