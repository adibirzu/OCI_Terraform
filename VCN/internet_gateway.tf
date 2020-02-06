resource "oci_core_internet_gateway" "TestTerraformInternetGateway" {
    compartment_id = oci_identity_compartment.TestTerraformCompartment.id
    display_name = "TestTerraformInternetGateway"
    vcn_id = oci_core_virtual_network.TestTerraformVCN.id
}
