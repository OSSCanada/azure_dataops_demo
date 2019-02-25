terraform {
  required_version = ">= 0.11.11"
  backend "azurerm" {
  }
}

provider "azurerm" {
  version = "=1.21.0"
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "test" {
  name     = "${var.AZURE_RESOURCE_GROUP_NAME}"
  location = "${var.AZURE_DC_LOCATION}"
}
resource "azurerm_eventhub_namespace" "test" {
  name                = "${var.AZURE_EVENTHUB_NAMESPACE}${random_integer.ri.result}"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  sku                 = "${var.AZURE_EVENTHUB_SKU}"
  capacity            = "${var.AZURE_EVENTHUB_CAPACITY}"
  kafka_enabled       = "${var.AZURE_EVENTHUB_KAFKA_ENABLED}"

  tags {
    environment = "${var.AZURE_ENVIRONMENT_TAG}"
  }
}

resource "azurerm_eventhub" "test" {
  name                = "${var.AZURE_EVENTHUB_HUBNAME}${random_integer.ri.result}"
  namespace_name      = "${azurerm_eventhub_namespace.test.name}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  partition_count     = "${var.AZURE_EVENTHUB_PARTITION_COUNT}"
  message_retention   = "${var.AZURE_EVENTHUB_MESSAGE_RETENTION}"
}

data "azurerm_data_lake_store" "test" {
  name                = "${var.AZURE_DATA_LAKE_STORE_NAME}${random_integer.ri.result}"
  resource_group_name = "${azurerm_resource_group.test.name}"
}

resource "azurerm_cosmosdb_account" "db" {
  name                = "${var.COSMOSDB_NAME}${random_integer.ri.result}"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  offer_type          = "${var.COSMOSDB_OFFER}"
  kind                = "${var.COSMOSDB_KIND}"

  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = "Session"
  }

  geo_location {
    location          = "${azurerm_resource_group.test.location}"
    failover_priority = 0
  }

  geo_location {
    location          = "${var.COSMOSDB_FAILOVER_LOCATION}"
    failover_priority = 1
  }

}