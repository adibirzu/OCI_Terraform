resource "oci_core_virtual_network" "TestTerraformVCN" {
  cidr_block = var.VCN-CIDR
  dns_label = "TestTerraform"
  compartment_id = oci_identity_compartment.TestCompartment.id
  display_name = "TestTerraformVCN"
}
