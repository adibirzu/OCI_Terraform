resource "oci_core_security_list" "TestTerraformSecurityList" {
    compartment_id = oci_identity_compartment.TestTerraformCompartment.id
    display_name = "TestTerraformSecurityList"
    vcn_id = oci_core_virtual_network.TestTerraformVCN.id
    
    egress_security_rules {
        protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    dynamic "ingress_security_rules" {
    for_each = var.service_ports
    content {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = ingress_security_rules.value
            min = ingress_security_rules.value
            }
        }
    }

    ingress_security_rules {
        protocol = "6"
        source = var.VCN-CIDR
    }
}
