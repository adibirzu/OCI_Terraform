resource "oci_core_route_table" "TestTerraformRouteTableViaIGW" {
    compartment_id = oci_identity_compartment.TestTerraformCompartment.id
    vcn_id = oci_core_virtual_network.TestTerraformVCN.id
    display_name = "TestTerraformRouteTableViaIGW"
    route_rules {
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = oci_core_internet_gateway.TestTerraformInternetGateway.id
    }
}
