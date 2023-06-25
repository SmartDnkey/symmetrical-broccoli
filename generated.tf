# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "google_container_cluster" "default" {
  cluster_ipv4_cidr           = "10.204.0.0/14"
  datapath_provider           = null
  default_max_pods_per_node   = null
  description                 = null
  enable_intranode_visibility = false
  enable_kubernetes_alpha     = false
  enable_l4_ilb_subsetting    = false
  enable_legacy_abac          = false
  enable_shielded_nodes       = true
  enable_tpu                  = false
  initial_node_count          = 1
  location                    = "europe-west2"
  logging_service             = "logging.googleapis.com/kubernetes"
  min_master_version          = null
  monitoring_service          = "monitoring.googleapis.com/kubernetes"
  name                        = "apirest-gke"
  network                     = "projects/mythic-hulling-390415/global/networks/mythic-hulling-390415-vpc"
  networking_mode             = "ROUTES"
  node_locations              = ["europe-west2-a", "europe-west2-b", "europe-west2-c"]
  node_version                = "1.25.8-gke.1000"
  private_ipv6_google_access  = null
  project                     = "mythic-hulling-390415"
  remove_default_node_pool    = null
  resource_labels             = {}
  subnetwork                  = "projects/mythic-hulling-390415/regions/europe-west2/subnetworks/mythic-hulling-390415-subnet"
  addons_config {
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
    network_policy_config {
      disabled = true
    }
  }
  binary_authorization {
    evaluation_mode = null
  }
  cluster_autoscaling {
    enabled = false
  }
  database_encryption {
    key_name = null
    state    = "DECRYPTED"
  }
  default_snat_status {
    disabled = false
  }
  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }
  network_policy {
    enabled  = false
    provider = "PROVIDER_UNSPECIFIED"
  }
  node_config {
    boot_disk_kms_key = null
    disk_size_gb      = 100
    disk_type         = "pd-balanced"
    guest_accelerator = []
    image_type        = "COS_CONTAINERD"
    labels            = {}
    local_ssd_count   = 0
    logging_variant   = "DEFAULT"
    machine_type      = "e2-medium"
    metadata = {
      disable-legacy-endpoints = "true"
    }
    min_cpu_platform = null
    node_group       = null
    oauth_scopes     = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
    preemptible      = false
    resource_labels  = {}
    service_account  = "default"
    spot             = false
    tags             = []
    taint            = []
    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = false
    }
  }
  node_pool {
    initial_node_count = 1
    max_pods_per_node  = 0
    name               = "apirest-test"
    name_prefix        = null
    node_count         = 1
    node_locations     = ["europe-west2-a", "europe-west2-b", "europe-west2-c"]
    version            = "1.25.8-gke.1000"
    management {
      auto_repair  = true
      auto_upgrade = true
    }
    network_config {
      create_pod_range     = false
      enable_private_nodes = false
      pod_ipv4_cidr_block  = null
      pod_range            = null
    }
    node_config {
      boot_disk_kms_key = null
      disk_size_gb      = 100
      disk_type         = "pd-balanced"
      guest_accelerator = []
      image_type        = "COS_CONTAINERD"
      labels            = {}
      local_ssd_count   = 0
      logging_variant   = "DEFAULT"
      machine_type      = "e2-medium"
      metadata = {
        disable-legacy-endpoints = "true"
      }
      min_cpu_platform = null
      node_group       = null
      oauth_scopes     = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
      preemptible      = false
      resource_labels  = {}
      service_account  = "default"
      spot             = false
      tags             = []
      taint            = []
      shielded_instance_config {
        enable_integrity_monitoring = true
        enable_secure_boot          = false
      }
    }
    upgrade_settings {
      max_surge       = 1
      max_unavailable = 0
      strategy        = "SURGE"
    }
  }
  node_pool_defaults {
    node_config_defaults {
      logging_variant = "DEFAULT"
    }
  }
  notification_config {
    pubsub {
      enabled = false
      topic   = null
    }
  }
  private_cluster_config {
    enable_private_endpoint     = false
    enable_private_nodes        = false
    master_ipv4_cidr_block      = null
    private_endpoint_subnetwork = null
    master_global_access_config {
      enabled = false
    }
  }
  release_channel {
    channel = "REGULAR"
  }
  service_external_ips_config {
    enabled = false
  }
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}
