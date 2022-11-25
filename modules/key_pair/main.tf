resource "aws_key_pair" "UST2-apC" {
  key_name   = "UST2-apC"
  public_key = file(var.key_path)
}