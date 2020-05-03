# Define webserver inside the public subnet
resource "aws_instance" "indexer" {
  count                       = 3
  ami                         = var.ami
  instance_type               = var.indexer
  key_name                    = "sterling"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = ["${aws_security_group.public_sg.id}"]
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = file("indexer.sh")


  tags = {
    Name = "Indexer-${count.index + 1}"
  }
}

resource "aws_instance" "search_head" {
  ami           = var.ami
  instance_type = var.search_head
  #key_name = aws_key_pair.default.id
  key_name                    = "sterling"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = ["${aws_security_group.public_sg.id}"]
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = file("search_head.sh")

  tags = {
    Name = "search_head"
  }
}

resource "aws_instance" "cluster_master" {
  ami           = var.ami
  instance_type = var.cluster_master
  #key_name = aws_key_pair.default.id
  key_name                    = "sterling"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = ["${aws_security_group.public_sg.id}"]
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = file("cluster_master.sh")

  tags = {
    Name = "cluster_master"
  }
}