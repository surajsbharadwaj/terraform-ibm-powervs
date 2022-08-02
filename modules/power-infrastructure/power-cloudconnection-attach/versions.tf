#####################################################
# powervs cloud connection create Module
# Copyright 2022 IBM
#####################################################

/***************************************************
NOTE: To source a particular version of IBM terraform provider, configure the parameter `version` as follows
terraform {
  required_version = ">=1.1"
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.21.0"
    }
  }
}
If we don't configure the version parameter, it fetches the latest provider version.
****************************************************/

terraform {
  required_version = ">=1.1"
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}