#Output for count
/*output "ec2-public-ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_ec2_instance[*].public_ip

}
output "ec2-public-dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.my_ec2_instance[*].public_dns

}
output "ec2-private-ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.my_ec2_instance[*].private_ip

}
*/

# Output for for_each
output "ec2_public_ip" {
  value = [
    for key in aws_instance.my_ec2_instance : key.public_ip
  ]
}

output "ec2_private_ip" {
  value = [
    for key in aws_instance.my_ec2_instance : key.private_ip
  ]
}


output "ec2_public_dns" {
  value = [
    for key in aws_instance.my_ec2_instance : key.public_dns
  ]
}