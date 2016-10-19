$update_channel="stable"

$worker_count=1
$worker_vm_memory=512
$worker_metadata = "environment=development,role=worker"

$data_store_count=3
$data_store_vm_memory=1024
$data_store_metadata = "environment=development,role=data-store"

$etcd_count=1
$etcd_vm_memory=512
$etcd_metadata = "environment=development,role=etcd"

$new_discovery_url="https://discovery.etcd.io/new?size=#{$etcd_count}"