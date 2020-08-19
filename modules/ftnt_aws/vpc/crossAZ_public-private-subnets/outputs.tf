output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}

output "private_subnet1_id" {
  value = aws_subnet.private_subnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}

output "private_subnet2_id" {
  value = aws_subnet.private_subnet2.id
}

output "public_subnet3_id" {
  value = aws_subnet.public_subnet2.id
}

output "private_subnet3_id" {
  value = aws_subnet.private_subnet2.id
}

output "private_rt_id" {
  value = aws_route_table.private_rt.id
}

