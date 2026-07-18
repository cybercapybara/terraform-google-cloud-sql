output "id" {
  description = "Identifier of the Cloud SQL instance."
  value       = google_sql_database_instance.this.id
}

output "name" {
  description = "Name of the Cloud SQL instance."
  value       = google_sql_database_instance.this.name
}

output "connection_name" {
  description = "Connection name used by the Cloud SQL Auth proxy."
  value       = google_sql_database_instance.this.connection_name
}

output "public_ip_address" {
  description = "Public IPv4 address of the instance, if enabled."
  value       = google_sql_database_instance.this.public_ip_address
}
