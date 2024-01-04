# Enterprise RESTful API for product cataloging

## Entity Relationship Diagram (ERD)

![Database Diagram](/_docs/products-catalog-db-diagram.png)

The diagram illustrates the relationships between the entities in the application. It helps in visualizing the structure of the database and understanding how different entities are connected.

## Authorization Configuration

## Overview

This application uses OAuth2 for resource server configuration to control access to different endpoints. The authorization logic is defined in the `ResourceServerConfig` class located in the `com.github.RianNegreiros.productcataloging.config` package.

## Roles and Permissions

### Public Endpoints

- `/oauth/token`: Endpoint for obtaining OAuth tokens.
- `/h2-console/**`: H2 console access (enabled only in the "test" profile).

These endpoints are accessible to the public and do not require authentication.

### Operator or Admin Endpoints

- `/products/**`: Access to product-related endpoints.
- `/categories/**`: Access to category-related endpoints.

Authenticated users with roles "OPERATOR" or "ADMIN" have permission to perform HTTP GET requests on these endpoints.

### Admin Endpoints

- `/users/**`: Access to user-related endpoints.

Authenticated users with the "ADMIN" role have permission to access these endpoints.

## Configuration Details

The configuration is defined in the `ResourceServerConfig` class. Here are some key points:

- The `JwtTokenStore` is used for token storage.
- The `PUBLIC` array contains public endpoints.
- The `OPERATOR_OR_ADMIN` array contains endpoints accessible by users with roles "OPERATOR" or "ADMIN."
- The `ADMIN` array contains endpoints accessible only by users with the "ADMIN" role.
- H2 console access is enabled only in the "test" profile.

## Additional Notes

- The H2 console access is disabled in production profiles to enhance security.

Feel free to customize the security configuration based on your specific use case and requirements.

## Tools and Technologies Used

- **Java**: Version 17
- **Spring Boot**: Version 2.4.4
- **Spring Cloud**: Version Hoxton.SR8
- **Database**: H2 (runtime scope), PostgreSQL (runtime scope)
- **Validation**: Spring Boot Starter Validation
- **Testing**: Spring Boot Starter Test, Spring Security Test
- **OAuth2**: Spring Security OAuth2 Autoconfigure

## Postman Collection

You can find the Postman collection for this project [here](/_docs/ProductCatalog.postman_collection.json).

This collection includes pre-configured API requests to help you test and interact with the endpoints.
