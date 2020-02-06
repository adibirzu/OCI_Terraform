resource "oci_core_dhcp_options" "TestTerraformDhcpOptions1" {
  compartment_id = oci_identity_compartment.TestTerraformCompartment.id
  vcn_id = oci_core_virtual_network.TestTerraformVCN.id
  display_name = "TestTerraformDHCPOptions1"

  // required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  // optional
  options {
    type = "SearchDomain"
    search_domain_names = [ "orcl.ro" ]
  }
}
