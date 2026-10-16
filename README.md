# Payment Systems Deployment & Management System

## Project Overview
An enterprise-grade deployment and automation project designed for payment systems environments (managing Banks, Payment Terminals, and Audit Logging). This project demonstrates core competencies in **Oracle Database administration (SQL & PL/SQL)** and **Linux System Administration / Automation (Bash Scripting)** tailored for a Junior Deployment Engineer role.

## Tech Stack & Environment
* **Database:** Oracle Database (PL/SQL, Tables, Constraints, Triggers, Audit Logging)
* **Operating System:** Oracle Linux (VirtualBox)
* **Automation & Scripting:** Bash Shell Scripting (`cron`, file management, error handling)
* **Version Control:** Git / GitHub


## Project Structure
```text
payment_system_db/
│
├── 01_schema.sql           # Database schema creation (Banks, Services, Terminals, Audit Logs)
├── 02_procedures.sql       # PL/SQL Stored Procedures for terminal lifecycle management
├── system_audit.sh         # Linux system health and resource monitoring script
└── dr_sync.sh              # Disaster Recovery (DR) backup and synchronization script

## Core Components
1. Database Architecture (01_schema.sql & 02_procedures.sql)

    Tables:

        banks: Manages participating financial institutions.

        payment_services: Defines available payment services.

        terminals: Tracks physical/virtual payment terminals (POS, ATMs, Web Gateways) linked to banks.

        audit_logs: Records all security and operational transactions.

    PL/SQL Procedures (manage_terminal): Handles secure addition, status modifications, and terminal terminations with built-in      transaction control (COMMIT/ROLLBACK) and automated audit logging.

2. Linux Operations & Automation (system_audit.sh & dr_sync.sh)

    system_audit.sh: Performs real-time system checks (disk space, memory usage, and active database processes) and logs reports     with timestamps.

    dr_sync.sh: Compresses project configurations and backups into tarballs, simulating secure synchronization to a Disaster         Recovery (DR) site directory.

## How to Run

1. Clone the repository:
git clone [https://github.com/sarakhalid1/payment-system-deployment.git](https://github.com/your-username/payment-system-deployment.git)
cd payment-system-deployment

2. Execute Database Scripts via SQL*Plus:
@01_schema.sql
@02_procedures.sql

3. Run Linux Automation Scripts:
chmod +x *.sh
./system_audit.sh
./dr_sync.sh
