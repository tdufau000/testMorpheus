provider "aws" {
  region     = "eu-west-1"
  access_key = "<%=cypher.read('secret/accesskey')%>"
  secret_key = "<%=cypher.read('secret/secretkey')%>"
}
