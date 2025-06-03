resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.name
  location                     = var.location
  administrator_login          = "samah"
  administrator_login_password = "SomeStrongPass"
  version                      = "12.0"
}

resource "azurerm_mssql_database" "sql_db" {
  name         = var.db_name
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
}


/*
resource "azurerm_private_endpoint" "example" {
  name                = "your-private-endpoint-name"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    private_connection_resource_id = azurerm_mssql_server.example.id
    is_automatic_approval           = true #Or false, depending on your approval needs
    group_ids                      = ["your-group-id-if-needed"] #e.g. "Server"
    private_dns_zone_group {
       name    = "private-dns-zone-group-name"
       resource_group_name = azurerm_resource_group.example.name
    }
  }
}

resource "azurerm_private_dns_zone_group" "example" {
  name                      = "your-private-dns-zone-group-name"
  resource_group_name       = azurerm_resource_group.example.name
  private_dns_zone_group_id = azurerm_private_dns_zone_group.example.id
}

resource "azurerm_private_dns_zone" "example" {
  name                       = "private-dns-zone-name"
  resource_group_name        = azurerm_resource_group.example.name
  resource_group_id    = azurerm_resource_group.example.id
  group_id           = "Server"
}



*/
