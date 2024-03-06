module "web-app" {
  source "../web-app-module"

  # Input Variables
  bucket_name = "web-app-bucket"
  domain = "my-example.com"
  db_name = "mydb"
  db_user = "donut"
  db_pass = var.db_pass
}