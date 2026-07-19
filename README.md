# terraform-google-cloud-sql

Terraform module that manages a [Google Cloud](https://cloud.google.com/)
Cloud SQL instance (`google_sql_database_instance`). It provisions a managed
PostgreSQL or MySQL instance with configurable tier, disk and availability.

## Usage

```hcl
module "cloud_sql" {
  source = "github.com/moveeeax/terraform-google-cloud-sql"

  project_id       = var.project_id
  name             = "prod-db"
  region           = "us-central1"
  database_version = "POSTGRES_15"
  tier             = "db-custom-2-7680"
  availability_type = "REGIONAL"
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| google    | >= 5.0   |

## Inputs

| Name                  | Description                                              | Type          | Default          | Required |
|-----------------------|----------------------------------------------------------|---------------|------------------|:--------:|
| `project_id`          | ID of the project in which to create the instance.       | `string`      | n/a              |   yes    |
| `name`                | Name of the Cloud SQL instance.                          | `string`      | n/a              |   yes    |
| `region`              | Region in which to create the instance.                  | `string`      | n/a              |   yes    |
| `database_version`    | Database engine version.                                 | `string`      | `"POSTGRES_15"`  |    no    |
| `tier`                | Machine tier for the instance.                           | `string`      | `"db-f1-micro"`  |    no    |
| `availability_type`   | Availability type: ZONAL or REGIONAL.                    | `string`      | `"ZONAL"`        |    no    |
| `disk_size`           | Data disk size in GB.                                    | `number`      | `10`             |    no    |
| `deletion_protection` | Whether the instance is protected from deletion.         | `bool`        | `true`           |    no    |
| `user_labels`         | User labels applied to the instance.                     | `map(string)` | `{}`             |    no    |

## Outputs

| Name                | Description                                       |
|---------------------|---------------------------------------------------|
| `id`                | Identifier of the Cloud SQL instance.            |
| `name`              | Name of the Cloud SQL instance.                  |
| `connection_name`   | Connection name used by the Auth proxy.          |
| `public_ip_address` | Public IPv4 address of the instance, if enabled. |

## License

[MIT](LICENSE)
