;; name project tfg4edgp
;; name program tfg4
;; name extension edgp

;; import necessary modules
(import "terraform-google-modules/cloud-storage-bucket/google" as storage_bucket)
(import "terraform-google-modules/cloud-storage-bucket-object/google" as storage_bucket_object)
(import "terraform-google-modules/cloud-kms/google" as kms)
(import "terraform-google-modules/cloud-secret-manager/google" as secret_manager)
(import "terraform-google-modules/cloud-run/google" as cloud_run)
(import "terraform-google-modules/cloud-build/google" as cloud_build)
(import "terraform-google-modules/google-cloud-storage-transfer/google" as storage_transfer)

(provider "google" {
  credentials = file("path/to/your/service-account-key.json")
  region     = "your-region"
})

(resource "google_kms_key_ring" "key_ring" {
  name     = "tfg4-key-ring"
  location = "your-location"
  project  = "your-project-id"
})

(resource "google_kms_crypto_key" "crypto_key" {
  name                   = "tfg4-crypto-key"
  key_ring_id            = google_kms_key_ring.key_ring.id
  purpose                = "ENCRYPT_DECRYPT"
  rotation_period         = "87600h" 365 days
  version_template {
    algorithm = "GOOGLE_SYMMETRIC_ENCRYPTION"
  }
})

(resource "google_secret_manager_secret" "secret" {
  name   = "tfg4-secret"
  project = "your-project-id"
  secret_data = jsonencode({
    key1 = "value1"
    key2 = "value2"
  })
replication {
    automatic {
      enabled = true
    }
 })

 (resource "google_cloud_storage_bucket" "bucket" {
   name     = "tfg4-bucket"
   project = "your-project-id"
   location = "your-location"
   force_destroy = true
   versioning {
     enabled = true
   }
   lifecycle_rule {
     action {
       type = "Delete"
     }
     condition {
       age = 30
     }
   }
   acl {
     entity = "project-editors@your-project-id.iam.gserviceaccount.com"
     role   = "READER"
   })


 (resource "google_cloud_storage_bucket_object" "object" {
   name   = "tfg4-object"
   bucket = google_cloud_storage_bucket.bucket.name
   source = "./path/to/your/file.txt"
   kms_key_name = google_kms_crypto_key.crypto_key.name
})

 (resource "google_cloud_run_service" "service" {
   name     = "tfg4-service"
   location = "your-location"
   project = "your-project-id"

   template {
     spec {
       containers {
         image = "gcr.io/your-project-id/tfg4:latest"
         ports {
           container_port = 8080
         }
       }
       service_account_name = "your-service-account-name@your-project-id.iam.gserviceaccount.com"
     }
     metadata {
       annotations = {
         "autoscaling.knative.dev/minScale" = "2"
         "autoscaling.knative.dev/maxScale" = "10"
       }
       labels = {
         "app" = "tfg4"
       }
     })






