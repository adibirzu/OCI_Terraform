resource "oci_core_subnet" "TestTerraformWebSubnet" {
  cidr_block = "10.0.1.0/24"
  display_name = "TestTerraformWebSubnet"
  dns_label = "TestTerraformN1"
  compartment_id = oci_identity_compartment.TestTerraformCompartment.id
  vcn_id = oci_core_virtual_network.TestTerraformVCN.id
  route_table_id = oci_core_route_table.TestTerraformRouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.TestTerraformDhcpOptions1.id
  security_list_ids = [oci_core_security_list.TestTerraformSecurityList.id]
}


