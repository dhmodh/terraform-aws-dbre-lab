# 🚀 Terraform DBRE Lab — Production-Style PostgreSQL Reliability Platform

A production-inspired **Database Reliability Engineering (DBRE)** project built using **Terraform**, **PostgreSQL Streaming Replication**, **PgBouncer**, **Datadog**, **Docker**, and **Healthcare Dummy Data**.

This project was designed to simulate a **real enterprise PostgreSQL DBRE environment** while learning:

- Infrastructure as Code (Terraform)
- PostgreSQL High Availability
- Streaming Replication
- Connection Pooling
- Database Observability
- Query Performance Tuning
- Incident Troubleshooting
- DBRE Automation
- Production-style multi-environment deployments

---

# 📌 Project Goal

The goal of this project is to:

✅ Learn Terraform practically  
✅ Build a real-world DBRE portfolio project  
✅ Simulate PostgreSQL production architecture locally  
✅ Practice database reliability engineering concepts  
✅ Learn troubleshooting used in real DBRE/SRE teams  
✅ Build something GitHub-worthy for interviews

Instead of creating toy examples, this project focuses on:

```txt
Real Infrastructure
Real Monitoring
Real Replication
Real Troubleshooting
Real Incident Scenarios
```

---

# 🏗️ High-Level Architecture

```txt
                           ┌────────────────────┐
                           │      pgAdmin       │
                           │    Port: 8080      │
                           └─────────┬──────────┘
                                     │
                           ┌─────────▼──────────┐
                           │     PgBouncer      │
                           │    Port: 6432      │
                           └─────────┬──────────┘
                                     │
                    ┌────────────────┴────────────────┐
                    │                                 │
          ┌─────────▼──────────┐         ┌──────────▼─────────┐
          │ PostgreSQL Primary │ ─────▶ │ PostgreSQL Replica │
          │     Port: 5432     │ WAL    │     Port: 5433     │
          └────────────────────┘ Stream └────────────────────┘
                           │
                           ▼
                  ┌──────────────────┐
                  │    Datadog       │
                  │   Monitoring     │
                  └──────────────────┘
```

---

# 🔥 Core Features

## Infrastructure as Code

- Terraform reusable modules
- Multi-environment architecture
- Docker-based infrastructure provisioning
- Environment isolation

Supported environments:

```txt
dev
qa
sandbox
prod
```

---

## PostgreSQL High Availability

This project implements:

### Primary PostgreSQL Instance

Used for:

```txt
Read + Write Operations
```

### Replica PostgreSQL Instance

Used for:

```txt
Read-only workload
Disaster recovery simulation
Replication testing
```

### Streaming Replication

Implemented using:

```txt
WAL Streaming
pg_basebackup
Replication User
Standby Mode
```

Verification:

```sql
SELECT * FROM pg_stat_replication;
```

---

## PgBouncer Connection Pooling

Production systems do not allow applications to directly create thousands of PostgreSQL connections.

Instead:

```txt
Application
      ↓
PgBouncer
      ↓
PostgreSQL
```

Benefits:

- Reduced database connection overhead
- Better scalability
- Lower CPU utilization
- Faster request handling

Pool mode:

```txt
Transaction Pooling
```

Monitoring:

```sql
SHOW POOLS;
```

---

## Datadog Monitoring

Integrated observability includes:

### Container Monitoring

- CPU usage
- Memory usage
- Network traffic
- Container health

### PostgreSQL Monitoring

- Active connections
- Locks
- Commits
- Rollbacks
- Database size
- Slow queries
- Replication monitoring

### PgBouncer Monitoring

- Pool utilization
- Active connections
- Waiting clients
- Idle connections

---

# 📂 Project Structure

```txt
terraform-aws-dbre-lab/
│
├── terraform/
│   ├── environments/
│   │   ├── dev/
│   │   ├── qa/
│   │   ├── sandbox/
│   │   └── prod/
│   │
│   └── modules/
│       ├── networking/
│       ├── postgres/
│       ├── pgadmin/
│       ├── pgbouncer/
│       └── datadog-agent/
│
├── monitoring/
│   └── datadog/
│       └── conf.d/
│
├── scripts/
│   ├── postgres/
│   │   ├── init/
│   │   └── config/
│   │
│   └── monitoring/
│
├── automation/
│
├── docs/
│
├── screenshots/
│
└── README.md
```

---

# 📁 Folder Explanation

## terraform/

Contains all infrastructure code.

### environments/

Environment-specific configuration.

Example:

```txt
dev
qa
sandbox
prod
```

Each environment contains:

```txt
main.tf
variables.tf
terraform.tfvars
outputs.tf
provider.tf
```

---

### modules/

Reusable Terraform modules.

#### networking/

Creates:

```txt
Docker Network
```

#### postgres/

Creates:

```txt
Primary PostgreSQL
Replica PostgreSQL
Streaming replication
Persistent volumes
```

#### pgadmin/

Creates:

```txt
pgAdmin UI
```

#### pgbouncer/

Creates:

```txt
Connection pooling layer
```

#### datadog-agent/

Creates:

```txt
Datadog monitoring agent
```

---

## scripts/

Contains:

### Initialization scripts

Used for:

```txt
Schema creation
Dummy data loading
Indexes
Replication setup
```

### Monitoring scripts

Used for:

```txt
Replication lag monitoring
Health checks
```

---

## monitoring/

Contains:

```txt
Datadog integration configs
```

---

## screenshots/

Contains screenshots for:

```txt
Replication proof
PgAdmin
Datadog dashboards
PgBouncer
Query troubleshooting
```

---

# 🩺 Healthcare Dummy Dataset

This project uses a realistic healthcare-inspired dataset to simulate a real production database.

Tables included:

```txt
patients
caregivers
appointments
claims
billing
audit_logs
```

Dataset size:

```txt
10,000+ patients
500+ caregivers
50,000+ appointments
20,000+ claims
20,000+ billing records
```

Why healthcare?

Because it closely resembles enterprise workloads involving:

```txt
Scheduling
Transactions
Auditing
High write throughput
Read-heavy reporting
```

---

# ⚙️ Tech Stack

| Category | Technology |
|----------|-------------|
| IaC | Terraform |
| Database | PostgreSQL 15 |
| Pooling | PgBouncer |
| Monitoring | Datadog |
| Containerization | Docker |
| UI | pgAdmin |
| Language | SQL, Bash |
| Dataset | Healthcare |

---

# 💻 Local Development Setup (Mac)

This project was developed and tested on:

```txt
macOS
Docker Desktop
Terraform
PostgreSQL 15
```

---

# 🔧 Prerequisites

Install the following:

## 1. Homebrew

Install:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Verify:

```bash
brew --version
```

---

## 2. Terraform

Install:

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

Verify:

```bash
terraform -version
```

Expected:

```txt
Terraform v1.x.x
```

---

## 3. Docker Desktop

Download:

:contentReference[oaicite:0]{index=0}

Verify:

```bash
docker ps
```

Expected:

```txt
CONTAINER ID
```

---

## 4. PostgreSQL Client

Install:

```bash
brew install postgresql
```

Verify:

```bash
psql --version
```

---

# 📥 Clone Repository

Clone project:

```bash
git clone https://github.com/dhmodh/terraform-aws-dbre-lab.git
```

Move into project:

```bash
cd terraform-aws-dbre-lab
```

---

# 🌍 Multi-Environment Architecture

This project supports:

```txt
dev
qa
sandbox
prod
```

Purpose of each:

| Environment | Purpose |
|-------------|---------|
| dev | Development and learning |
| qa | Testing |
| sandbox | Experiments |
| prod | Production simulation |

Environment-specific Terraform:

```txt
terraform/environments/
```

Example:

```txt
terraform/environments/dev
```

---

# 🚀 Infrastructure Deployment

## Deploy DEV Environment

Move to environment:

```bash
cd terraform/environments/dev
```

Initialize Terraform:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Format code:

```bash
terraform fmt -recursive
```

Preview changes:

```bash
terraform plan
```

Deploy:

```bash
terraform apply
```

Type:

```txt
yes
```

---

# 🐳 Verify Running Containers

Check:

```bash
docker ps
```

Expected:

```txt
dev-postgres-primary
dev-postgres-replica
dev-pgadmin
dev-pgbouncer
dev-datadog-agent
```

---

# 🧩 Ports Used

| Service | Port |
|---------|------|
| PostgreSQL Primary | 5432 |
| PostgreSQL Replica | 5433 |
| PgBouncer | 6432 |
| pgAdmin | 8080 |

---

# 🖥️ pgAdmin Access

Open browser:

```txt
http://localhost:8080
```

Login:

```txt
Email:
admin@dbre.com

Password:
admin123
```

---

## Add PostgreSQL Primary Server

### General

```txt
DBRE Primary
```

### Connection

```txt
Host:
postgres-primary

Port:
5432

Username:
dishant

Password:
dishant123

Database:
healthcare_dbre
```

---

## Add PostgreSQL Replica Server

### General

```txt
DBRE Replica
```

### Connection

```txt
Host:
postgres-replica

Port:
5432

Username:
dishant

Password:
dishant123

Database:
healthcare_dbre
```

---

# 🗄️ PostgreSQL Streaming Replication

Replication is implemented using:

```txt
WAL Streaming
pg_basebackup
Replication User
Standby Mode
```

Architecture:

```txt
Primary
    ↓
WAL Streaming
    ↓
Replica
```

---

## Verify Replication

Connect primary:

```bash
docker exec -it dev-postgres-primary psql -U dishant -d healthcare_dbre
```

Run:

```sql
SELECT
client_addr,
state,
sync_state
FROM pg_stat_replication;
```

Expected:

```txt
streaming
```

---

## Test Replication

Insert on primary:

```sql
INSERT INTO audit_logs (
table_name,
action_type,
changed_by
)
VALUES (
'patients',
'INSERT',
'dishant'
);
```

Now connect replica:

```bash
docker exec -it dev-postgres-replica psql -U dishant -d healthcare_dbre
```

Verify:

```sql
SELECT *
FROM audit_logs
ORDER BY log_id DESC
LIMIT 5;
```

If row exists:

```txt
Replication working successfully
```

---

# 🔄 PgBouncer Connection Pooling

PgBouncer is configured using:

```txt
Transaction Pooling
```

Why?

Because PostgreSQL connections are expensive.

Instead of:

```txt
1000 requests
=
1000 DB connections
```

We use:

```txt
1000 requests
=
50 pooled connections
```

---

## Connect Through PgBouncer

Run:

```bash
psql \
-h localhost \
-p 6432 \
-U dishant \
-d healthcare_dbre
```

Password:

```txt
dishant123
```

Test:

```sql
SELECT version();
```

---

## Verify Connection Pooling

Run:

```sql
SHOW POOLS;
```

This displays:

```txt
active clients
idle clients
waiting clients
server connections
```

---

# 📊 Datadog Monitoring

Datadog provides observability for:

### PostgreSQL

```txt
connections
database size
locks
commits
rollbacks
replication metrics
```

### PgBouncer

```txt
pool utilization
active connections
waiting clients
```

### Containers

```txt
CPU
memory
network
uptime
```

---

## Datadog Dashboard

Open:

:contentReference[oaicite:1]{index=1}

Suggested dashboard:

```txt
DBRE PostgreSQL Platform
```

Suggested widgets:

```txt
postgresql.connections
postgresql.database_size
postgresql.locks
docker.cpu.usage
docker.mem.rss
postgresql.commits
postgresql.rollbacks
```

---

# 🧪 DBRE Troubleshooting Lab

One of the main goals of this project is to simulate **real-world Database Reliability Engineering (DBRE)** scenarios.

This lab helps practice:

```txt
Query Troubleshooting
Deadlocks
Blocking Sessions
Slow Queries
Replication Monitoring
Connection Pooling
Incident Handling
```

These are real problems that DBRE/SRE teams troubleshoot in production.

---

# 🐢 Slow Query Troubleshooting

This project enables:

```txt
pg_stat_statements
```

to analyze query performance.

---

## Example Slow Query

Connect:

```bash
psql \
-h localhost \
-p 6432 \
-U dishant \
-d healthcare_dbre
```

Run intentionally slow query:

```sql
EXPLAIN ANALYZE
SELECT *
FROM appointments
WHERE notes LIKE '%visit%';
```

Why is it slow?

Because:

```txt
Wildcard search
+
No useful index
=
Sequential Scan
```

---

## Analyze Slow Queries

Connect primary:

```bash
docker exec -it dev-postgres-primary psql -U dishant -d healthcare_dbre
```

Run:

```sql
SELECT
query,
calls,
total_exec_time,
mean_exec_time
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 10;
```

This helps identify:

```txt
Most expensive queries
Frequently executed queries
High latency queries
```

---

# 🔒 Blocking Session Lab

Blocking happens when:

```txt
Session A
locks row
↓
Session B waits
```

---

## Create Blocking Scenario

### Terminal 1

Connect:

```bash
psql \
-h localhost \
-p 6432 \
-U dishant \
-d healthcare_dbre
```

Run:

```sql
BEGIN;

UPDATE patients
SET city='Dallas'
WHERE patient_id=1;
```

Do **NOT** commit.

This session now holds a lock.

---

### Terminal 2

Connect again:

```bash
psql \
-h localhost \
-p 6432 \
-U dishant \
-d healthcare_dbre
```

Run:

```sql
UPDATE patients
SET city='Miami'
WHERE patient_id=1;
```

This query will:

```txt
HANG / WAIT
```

Congratulations:

You created a **real blocking scenario**.

---

## Diagnose Blocking Sessions

Connect primary:

```bash
docker exec -it dev-postgres-primary psql -U dishant -d healthcare_dbre
```

Run:

```sql
SELECT
blocked.pid AS blocked_pid,
blocked.query AS blocked_query,
blocking.pid AS blocking_pid,
blocking.query AS blocking_query
FROM pg_stat_activity blocked
JOIN pg_stat_activity blocking
ON blocking.pid = ANY(pg_blocking_pids(blocked.pid));
```

This query shows:

```txt
Who is blocked
Who is blocking
Blocking query
Blocked query
```

Real DBRE production troubleshooting.

---

## Kill Blocking Session

Find PID:

```sql
SELECT pid, query
FROM pg_stat_activity;
```

Terminate blocker:

```sql
SELECT pg_terminate_backend(<PID>);
```

Blocked query resumes.

---

# 💥 Deadlock Lab

A deadlock happens when:

```txt
Session A waits for Session B
AND
Session B waits for Session A
```

PostgreSQL automatically kills one transaction.

---

## Create Deadlock

### Terminal 1

Run:

```sql
BEGIN;

UPDATE patients
SET city='Dallas'
WHERE patient_id=1;
```

---

### Terminal 2

Run:

```sql
BEGIN;

UPDATE patients
SET city='Miami'
WHERE patient_id=2;
```

---

### Trigger Deadlock

#### Terminal 1

```sql
UPDATE patients
SET city='Austin'
WHERE patient_id=2;
```

#### Terminal 2

```sql
UPDATE patients
SET city='Chicago'
WHERE patient_id=1;
```

Expected:

```txt
deadlock detected
```

---

## Diagnose Deadlocks

Run:

```sql
SELECT
deadlocks,
temp_files,
temp_bytes
FROM pg_stat_database
WHERE datname='healthcare_dbre';
```

---

# 🔍 Lock Monitoring

View locks:

```sql
SELECT *
FROM pg_locks;
```

Monitor:

```txt
Row Locks
Table Locks
Transaction Locks
Exclusive Locks
Shared Locks
```

---

# 🔄 Replication Monitoring

Connect primary:

```bash
docker exec -it dev-postgres-primary psql -U dishant -d healthcare_dbre
```

Check replication:

```sql
SELECT
client_addr,
state,
sync_state
FROM pg_stat_replication;
```

Expected:

```txt
streaming
```

---

## Replication Lag Query

Run:

```sql
SELECT
application_name,
client_addr,
state,
sync_state,
pg_size_pretty(
pg_wal_lsn_diff(
pg_current_wal_lsn(),
replay_lsn
)
) AS replication_lag
FROM pg_stat_replication;
```

Used to monitor:

```txt
Replica lag
Replication health
WAL shipping
```

---

# 📈 Query Performance Testing

Test queries:

```sql
EXPLAIN ANALYZE
SELECT *
FROM appointments
WHERE patient_id = 100;
```

---

```sql
EXPLAIN ANALYZE
SELECT city, COUNT(*)
FROM patients
GROUP BY city;
```

---

```sql
EXPLAIN ANALYZE
SELECT claim_status, COUNT(*)
FROM claims
GROUP BY claim_status;
```

Used to learn:

```txt
Execution plans
Index usage
Sequential scans
Cost estimation
```

---

# 🔁 Terraform Workflow

## Initialize

```bash
terraform init
```

---

## Validate

```bash
terraform validate
```

---

## Format

```bash
terraform fmt -recursive
```

---

## Preview Changes

```bash
terraform plan
```

---

## Deploy

```bash
terraform apply
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

# 🔄 Git Workflow

Check changes:

```bash
git status
```

Add files:

```bash
git add .
```

Commit:

```bash
git commit -m "your commit message"
```

Push:

```bash
git push origin main
```

---

# 🧯 Common Issues & Troubleshooting

## Docker Not Running

Error:

```txt
Cannot connect to Docker daemon
```

Fix:

Open:

```txt
Docker Desktop
```

Then:

```bash
docker ps
```

---

## Terraform Module Error

Error:

```txt
Module not installed
```

Fix:

```bash
terraform init
```

---

## PgBouncer Authentication Error

Error:

```txt
wrong password type
```

Fix:

```txt
Validate DATABASE_URL config
```

Re-run:

```bash
terraform apply
```

---

## Replication Not Working

Check:

```sql
SELECT *
FROM pg_stat_replication;
```

Expected:

```txt
streaming
```

---

## Replica Container Failed

Check logs:

```bash
docker logs dev-postgres-replica
```

---

# 📸 Screenshots

Add screenshots here:

```txt
screenshots/
```

Suggested screenshots:

```txt
pgAdmin UI
Terraform Apply
Datadog Dashboard
Streaming Replication
PgBouncer
SHOW POOLS
Slow Query Analysis
Deadlock Example
```

Example:

```md
![pgAdmin](screenshots/pgadmin.png)

![Replication](screenshots/replication.png)

![Datadog Dashboard](screenshots/datadog-dashboard.png)
```

---

# 🎯 Skills Learned

This project covers:

### Infrastructure as Code

```txt
Terraform
Reusable Modules
Environment Management
Docker Infrastructure
```

### PostgreSQL

```txt
Streaming Replication
WAL
pg_basebackup
Query Optimization
Indexes
Performance Tuning
```

### Reliability Engineering

```txt
Incident Troubleshooting
Replication Monitoring
Connection Pooling
Database Observability
Performance Analysis
```

### Monitoring

```txt
Datadog
Metrics
Container Monitoring
DB Health
```

### Performance

```txt
Slow Query Analysis
Deadlocks
Blocking Sessions
Lock Troubleshooting
```

---

# 🛣️ Future Enhancements

Planned improvements:

```txt
Backup & Recovery
Chaos Engineering
GitHub Actions CI/CD
Security Hardening
Python DBRE Automation
Runbooks
Load Testing
```

---

# 👨‍💻 Author

### Dishant Modh

**Database Reliability Engineer | SRE | PostgreSQL | Cloud | Automation**

GitHub:

:contentReference[oaicite:0]{index=0}

LinkedIn:

:contentReference[oaicite:1]{index=1}

---

# ⭐ Support

If you found this project useful:

```txt
Star the repository
Fork it
Try the lab
Contribute improvements
```

---

# 📜 License

This project is for:

```txt
Learning
Portfolio Building
Database Reliability Engineering Practice
```

Feel free to fork and experiment.

---

## 🚀 Final Thoughts

This project was built to simulate how **real-world DBRE teams operate PostgreSQL in production**.

Instead of only learning theory, this lab focuses on:

```txt
Building
Breaking
Monitoring
Troubleshooting
Fixing
```

Because:

> The best way to learn reliability engineering is by operating systems and solving failures.

Happy Learning 🚀
