terraform {
  backend "s3" {
  	endpoint = "storage.yandexcloud.net"
    bucket = "infrabucket-ssi-prod"
    key    = "terraform.tfstate"
    region = "us-east-1"
	skip_credentials_validation = true
  }
}
