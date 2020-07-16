// This is a just dummy configuration for yandex_storage_bucket
// It's needed for tests

resource "yandex_storage_bucket" "test" {
  bucket = "tf-test-bucket"
}
