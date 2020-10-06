terraform {
    backend "s3" {
        bucket = "Wek_2-del-devops-bucket"
        key    = "devops_key"
        region = "us-east-2"
    }
}