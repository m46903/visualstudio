output "indexers" {
  value = [aws_instance.indexer.*.public_ip]
}
output "search_head" {
  value = [aws_instance.search_head.*.public_ip]
}
output "cluster_master" {
  value = [aws_instance.search_head.*.public_ip]
}