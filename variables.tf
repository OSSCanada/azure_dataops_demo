variable "AZURE_ENVIRONMENT_TAG" {
  default = "test"
}


variable "AZURE_RESOURCE_GROUP_NAME" {
  default = "rkdataopsdemo"
}

variable "AZURE_DC_LOCATION" {
  default = "Canada Central"
}

variable "AZURE_EVENTHUB_NAMESPACE" {
  default = "defaultnamespace"
}

variable "AZURE_EVENTHUB_SKU" {
  default = "Standard"
}

variable "AZURE_EVENTHUB_CAPACITY" {
  default = "1"
}

variable "AZURE_EVENTHUB_KAFKA_ENABLED" {
  default = "true"
}

variable "AZURE_EVENTHUB_HUBNAME" {
  default ="defaulthubname"
}

variable "AZURE_EVENTHUB_PARTITION_COUNT" {
  default = "2"
}


variable "AZURE_EVENTHUB_MESSAGE_RETENTION" {
  default = "1"
}

variable "AZURE_DATA_LAKE_STORE_NAME" {
  default="testdatalake"
}

variable "COSMOSDB_NAME" {
  default = "testdb"
}

variable "COSMOSDB_OFFER" {
  default = "Standard"
}

variable "COSMOSDB_KIND" {
  default="GlobalDocumentDB"
}

variable "COSMOSDB_CONSISTENCY_LEVEL" {
  default = "Session"
}


variable "COSMOSDB_FAILOVER_LOCATION" {
  default = "Canada East"
}

variable "AZURE_FUNCTIONAPP_NAME" {
  default = "testfunc"
}
