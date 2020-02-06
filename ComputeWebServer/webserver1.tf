resource "oci_core_instance" "TestTerraformWebserver1" {
  availability_domain = var.ADs[1]
  compartment_id = oci_identity_compartment.TestTerraformCompartment.id
  display_name = "TestTerraformWebServer1"
  shape = var.Shapes[0]
  subnet_id = oci_core_subnet.TestTerraformWebSubnet.id
  source_details {
    source_type = "image"
    source_id   = var.Images[0]
  }
  metadata = {
      ssh_authorized_keys = file(var.public_key_oci)
  }
  create_vnic_details {
     subnet_id = oci_core_subnet.TestTerraformWebSubnet.id
     assign_public_ip = true 
  }
}

data "oci_core_vnic_attachments" "TestTerraformWebserver1_VNIC1_attach" {
  availability_domain = var.ADs[1]
  compartment_id = oci_identity_compartment.TestTerraformCompartment.id
  instance_id = oci_core_instance.TestTerraformWebserver1.id
}

data "oci_core_vnic" "TestTerraformWebserver1_VNIC1" {
  vnic_id = data.oci_core_vnic_attachments.TestTerraformWebserver1_VNIC1_attach.vnic_attachments.0.vnic_id
}

output "TestTerraformWebserver1PublicIP" {
   value = [data.oci_core_vnic.TestTerraformWebserver1_VNIC1.public_ip_address]
}
