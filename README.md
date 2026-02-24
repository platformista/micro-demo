# Multi-Stack Microservices Demo (Upsun Edition)

## Overview
This project is a comprehensive showcase of a polyglot microservices architecture running on **Upsun**. It demonstrates how to manage multiple technologies (Node.js, Go, Python, Java), shared services, and complex routing within a single Git repository using **Git-Driven Infrastructure**.

## Special Remarks for Demoing
This example is for learning purposes only and is not intended as a starting point for an actual production instance. 

In this version, the project has been migrated to the **Upsun Unified Configuration** format, consolidating all infrastructure definitions into a single `.upsun/config.yaml` file.

### Architecture Highlights

#### Applications
All application containers are defined under the `applications:` key in `.upsun/config.yaml`:
* **Frontend**: A React application accessible at the apex domain.
* **API Gateway**: A Node.js (KrakenD) gateway that proxies traffic to internal microservices.
* **Microservices**: Four distinct services written in **Go, Java, Python, and Node.js**.
* **Identity & Security**: A managed **Keycloak** instance and a **HashiCorp Vault** instance.
* **Workers**: Two background workers (Python and Go) demonstrating asynchronous processing and the **Flex resource model** (defined with low CPU/RAM footprints).
* **Shared Storage**: A Network Storage service mounted to the Python and Go applications/workers for shared data persistence.

#### Services
Defined under the `services:` key:
* **PostgreSQL**: A shared database for microservices, configured with multiple schemas and specific **endpoints** (admin, reporter, and importer) to demonstrate granular access control via `relationships`.
* **MariaDB**: A dedicated database for the Keycloak instance.
* **Network Storage**: A persistent shared filesystem for polyglot data exchange.

#### Routing
Public exposure is managed under the `routes:` key:
* `https://{default}/` -> Frontend
* `https://api.{default}/` -> API Gateway
* `https://keycloak.{default}/` -> Keycloak
* `https://vault.{default}/` -> Vault

## Core Upsun Concepts Demonstrated

### 1. Unified Configuration
All infrastructure—including the 10+ application containers and their supporting services—is defined in a single file: `.upsun/config.yaml`. This replaces the legacy `.platform/applications.yaml`, `.platform/services.yaml`, and `.platform/routes.yaml` structure.

### 2. Flex Resource Model
Each container in this demo has explicitly defined resources (CPU and RAM). This allows you to right-size the Java service (which may need more memory) differently than a lightweight Go worker, optimizing both performance and cost.

### 3. Inter-Service Communication
Internal routing is "opt-in." Applications can only communicate with services or other applications if a `relationship` is explicitly defined. This demo shows the API Gateway linked to the internal microservices, keeping them shielded from the public internet.

### 4. Ephemeral Environments
Because this is on Upsun, every Git branch creates a byte-for-byte clone of this entire stack. Running `upsun environment:branch my-feature` will clone all 10 apps and 2 databases into a preview environment with its own unique URLs.

## Deployment & Management
To interact with this project, use the **Upsun CLI**:

* **Deploy changes**: `upsun push`
* **Access a container**: `upsun ssh -a [app-name]`
* **Scale resources**: `upsun resources:set`
* **Stream logs**: `upsun log`

## Contribution
- Initial demo by Ori.
- Ported to Upsun Unified Config by @Gemini-Upsun-Expert.
