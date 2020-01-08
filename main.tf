variable "region" {
  default = "us-west-2"
}

variable "owner_id" {
  default = "1234567890"
}

data "template_file" "iam_policy" {
  template = "${file("templates/iam_policy.tpl.json")}"
  vars = {
    region   = "${var.region}"
    owner_id = "${var.owner_id}"
  }
}
output "iam_policy" {

  value = "${data.template_file.iam_policy.rendered}"
}