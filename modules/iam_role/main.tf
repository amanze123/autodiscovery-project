# IAM POLICY DOCUMENT TO ENABLE ANSIBLE TO ACESS SOME ACTIONS ON OUR AWS ACCOUNT TO 
# DISCOVER INSTANCES CREATED BY AUTOSCALING GROUP WITHOUT ESCALATING PRIVILEGES
data "aws_iam_policy_document" "ansible-host" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:Describe*",
      "autoscaling:Describe*",
      "ec2:DescribeTags*"
    ]
    resources = ["*"]
  }
}
resource "aws_iam_policy" "ansible_host" {
  name        = "ansible-cli-policy"
  path        = "/"
  description = "Access policy for Ansible_node to connect to aws account"
  policy      = data.aws_iam_policy_document.ansible-host.json
}

# Create iam policy document to allow Ansible host assume role
data "aws_iam_policy_document" "ansible_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
resource "aws_iam_role" "ansible_role" {
  name               = "ansible-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ansible_policy_document.json
}

# Here we attach the iam policy to the iam role created
resource "aws_iam_role_policy_attachment" "ansible_policy_attachment" {
  role       = aws_iam_role.ansible_role.name
  policy_arn = aws_iam_policy.ansible_host.arn
}

# Then we create an iam instance profile to attach to our Ansible host
resource "aws_iam_instance_profile" "ansible_aws_instance_profile" {
  name = "ansible_aws_instance_profile"
  role = aws_iam_role.ansible_role.name
}