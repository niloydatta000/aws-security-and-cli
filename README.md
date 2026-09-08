# AWS Security Monitoring & CLI

## Overview

A practical AWS learning and reference project covering **AWS security monitoring, observability, auditing, and command-line administration**.

This repository contains hands-on documentation and scripts for working with:

- **Amazon GuardDuty** threat detection and security findings
- **Amazon CloudWatch** metrics, logs, dashboards, alarms, and observability
- **AWS CloudTrail** API activity, auditing, and account event history
- **AWS Command Line Interface (AWS CLI)** installation, configuration, administration, automation, and scripting
- **AWS CLI installation scripts** for Linux and Windows

The project is intended as a practical reference for learning AWS administration and security operations from both the **AWS Management Console** and the **command line**.

---

## Project Structure

```text
.
├── AWS_GuardDuty.md
├── AWS_CloudWatch.md
├── AWS_CloudTrail.md
├── AWSCLI_FULL.md
├── InstallationScripts/Linux_AMD64/setup.sh
└── InstallationScripts/Windows/setup.ps1
```

### Documentation

| File | Description |
|---|---|
| `AWS_GuardDuty.md` | GuardDuty overview, enabling the service, sample findings, finding investigation, filtering, archiving, and suspension |
| `AWS_CloudWatch.md` | CloudWatch concepts, metrics, logs, traces, dashboards, alarms, Logs Insights, Metric Math, and Synthetics |
| `AWS_CloudTrail.md` | CloudTrail auditing, Event History, login-event investigation, and CLI-based event lookup |
| `AWSCLI_FULL.md` | Comprehensive AWS CLI installation, configuration, command syntax, filtering, output formats, service management, scripting, automation, CI/CD, and security practices |

### Installation Scripts

| File | Platform | Purpose |
|---|---|---|
| `setup.sh` | Linux | Downloads and installs AWS CLI v2 |
| `setup.ps1` | Windows | Installs AWS CLI v2 using the Windows MSI installer through PowerShell |

---

## AWS Services Covered

### Amazon GuardDuty

Amazon GuardDuty is a threat detection service that continuously monitors AWS accounts, workloads, and data for potentially malicious activity. The documentation demonstrates enabling GuardDuty, generating sample findings, examining finding details, filtering findings, archiving findings, and suspending the service. 
Key topics:

- GuardDuty protection
- Threat detection
- Sample findings
- Finding severity
- Finding types
- Resource information
- Finding investigation
- Finding filtering
- Finding archiving
- Current vs. archived findings

---

### Amazon CloudWatch

CloudWatch provides monitoring and observability for AWS resources and applications. The documentation covers metrics, logs, traces, dashboards, alarms, Logs Insights, Metric Math, Metrics Insights, and Synthetics. 
Key topics:

- Metrics
- Logs
- Traces
- CloudWatch dashboards
- CloudWatch alarms
- CloudWatch Logs
- Logs Insights
- Metric Math
- Metrics Insights
- Synthetics and canaries
- EC2 `CPUUtilization` monitoring
- Log querying
- Threshold-based alerting
- Amazon SNS notification integration

Example Logs Insights query:

```
fields @timestamp, remoteIP, request, status, filename
| sort @timestamp desc
| filter filename="/var/www/html/index.html"
```

Example EC2 metric query:

```text
SEARCH('{AWS/EC2,InstanceId} MetricName="CPUUtilization"', 'Average')
```

---

### AWS CloudTrail

AWS CloudTrail records account activity generated through the AWS Management Console, AWS CLI, SDKs, APIs, and AWS services. It can be used for operational auditing, security investigation, governance, and compliance.

The documentation demonstrates:

- CloudTrail Event History
- Searching account activity
- Investigating `ConsoleLogin` events
- Filtering events by time
- Identifying users and source IP addresses
- AWS CLI event lookup
- Viewing recent events

Example:

```bash
aws cloudtrail lookup-events \
  --lookup-attributes AttributeKey=EventName,AttributeValue=ConsoleLogin
```

View the latest events:

```bash
aws cloudtrail lookup-events --max-items 10
```

---

# AWS CLI

AWS CLI provides a unified command-line interface for managing AWS services. This project documents installation, configuration, command structure, parameters, output processing, service discovery, resource management, scripting, automation, and secure usage.

## AWS CLI Installation

### Linux

The included `InstallationScripts/Linux_AMD64/setup.sh` script downloads the AWS CLI v2 Linux package, extracts it, sets execute permission on the installer, and runs the installer with elevated privileges.

Run:

```bash
git clone https://github.com/niloydatta000/aws-security-and-cli.git
cd aws-security-and-cli
chmod +x ./InstallationScripts/Linux_AMD64/setup.sh
./InstallationScripts/Linux_AMD64/setup.sh
```

**The script performs:**

```bash
curl -Lo awscliv2.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"

unzip awscliv2.zip
chmod a+x ./aws/install
sudo ./aws/install
```
> **N.B: If You do not have `sudo` access, folllow `InstallationScripts/Linux_AMD64/README.md`

### Windows

The included `InstallationScripts/Windows.setup.ps1` script uses PowerShell and `msiexec.exe` to download and install the AWS CLI v2 MSI package.

Run PowerShell **as Administrator**, then execute:

```powershell
& .\InstallationScripts\Windows\setup.ps1
```

---

## Verify Installation

After installation, verify the AWS CLI:

```bash
aws --version
```

Example:

```
aws-cli/2.x.x Python/3.x.x ...
```

The AWS CLI documentation in this repository uses `aws --version` as the installation verification step.

---

# AWS CLI Configuration

Configure the AWS CLI with:

```bash
aws configure
```

The configuration process covers:

- AWS Access Key ID
- AWS Secret Access Key
- Default AWS Region
- Default output format

Example:

```
AWS Access Key ID [None]: EXAMPLEACCESSID
AWS Secret Access Key [None]: EXampleSecretAccessKey
Default region name [None]: us-west-2
Default output format [None]: json
```

Verify the configuration with:

```bash
aws s3 ls
```

These configuration and verification steps are documented in `AWSCLI_FULL.md`.

> **Security:** Never commit real AWS credentials, access keys, secret keys, tokens, or other sensitive information to this repository.

---

# AWS CLI Command Structure

AWS CLI commands generally follow such examples:

```bash
aws ec2 describe-instances
aws s3 ls
aws iam list-users
```

The repository also covers required and optional parameters, parameter types, output control, Boolean flags, JSON parameters, parameter files, and `--dry-run`. 
---

# Output and Filtering

The documentation covers multiple AWS CLI output formats:

- **JSON**
- **Text**
- **Table**
- **YAML**

Examples:

```bash
aws ec2 describe-instances --output json
aws ec2 describe-instances --output text
aws ec2 describe-instances --output table
```

It also covers:

- Server-side filtering
- Client-side filtering
- JMESPath queries
- Pagination
- Combining filters with `--query`
- Using `jq` for advanced JSON processing

Example:

```bash
aws ec2 describe-instances \
  --filters "Name=instance-state-name,Values=running" \
  --query 'Reservations[].Instances[].{ID:InstanceId,Type:InstanceType,IP:PublicIpAddress}'
```



---

# AWS CLI Help and Service Discovery

AWS CLI includes a built-in help system.

**General help:**

```bash
aws help
```

**Service-level help:**

```bash
aws ec2 help
```

**Operation-level help:**

```bash
aws ec2 describe-instances help
```


---

# AWS Resource Management

The AWS CLI documentation includes practical examples for:

### Amazon EC2

- Launching instances
- Listing instances
- Filtering instances
- Starting instances
- Stopping instances
- Rebooting instances
- Working with AMIs
- Security groups
- Key pairs
- Block storage
- Instance tags



### Identity and Access Mananagement (IAM)

- Creating users
- Creating groups
- Adding users to groups
- Attaching managed policies
- Creating customer-managed policies
- Creating inline policies
- Policy validation with IAM Access Analyzer



### Amazon S3

- Bucket management
- Object management
- High-level `aws s3` commands
- API-level `aws s3api` commands
- File transfers
- Synchronization
- Bucket cleanup
- Large-object considerations



---

# AWS CLI Automation

The project also introduces AWS CLI scripting and automation concepts, including:

- Shell scripting
- Configuration management
- Functions
- Input validation
- Exit-code checking
- Logging
- Resource provisioning
- Backup automation
- Monitoring and maintenance
- Multi-environment deployments
- Dynamic resource discovery
- Conditional workflows
- Batch operations
- CI/CD integration



Example:

```bash
if ! aws s3 cp myfile.txt s3://mybucket/ 2>/dev/null; then
    echo "Error: Failed to upload file to S3"
    exit 1
fi
```

---

# Error Handling and Debugging

The AWS CLI documentation covers common categories of errors:

- Authentication and authorization errors
- Network and connectivity errors
- Service-specific errors
- Configuration errors

It also covers:

- Exit status checking
- `--debug`
- CLI command history
- Structured script logging
- Input validation
- Error handling

Example:

```bash
aws s3 ls --debug > debug_output.log 2>&1
```



---

# CI/CD Integration

AWS CLI can be incorporated into CI/CD workflows for tasks such as:

- Uploading artifacts to S3
- Pushing images to Amazon ECR
- Updating ECS services
- Deploying CloudFormation stacks
- Updating Lambda functions
- Retrieving configuration values
- Managing secrets

The documentation also covers authentication, environment isolation, error handling, logging, and multi-account deployment patterns.

---

# Security Practices

Security considerations documented in this project include:

- Prefer IAM roles over long-term access keys where appropriate
- Apply least privilege
- Avoid hardcoding credentials
- Protect sensitive information
- Avoid exposing secrets in logs
- Use AWS Secrets Manager or Systems Manager Parameter Store
- Filter sensitive command output
- Implement error handling and validation
- Maintain appropriate logging and auditing



---

# Learning Focus

This repository brings together several AWS capabilities that are particularly useful for understanding cloud security and operations:

```
                    AWS Environment
                          │
          ┌───────────────┼───────────────┐
          │               │               │
     CloudTrail       CloudWatch       GuardDuty
     Audit Logs       Monitoring       Threat Detection
          │               │               │
          └───────────────┼───────────────┘
                          │
                      AWS CLI
                          │
              ┌───────────┴───────────┐
              │                       │
        Manual Operations         Automation
              │                       │
        EC2 / IAM / S3          Shell / CI/CD
```

Together, these topics provide practical exposure to **AWS monitoring, auditing, threat detection, resource administration, command-line operations, and automation**.

---

# Recommended Learning Flow

For someone using this repository as a learning path:

1. Install AWS CLI
2. Verify the installation
3. Configure the AWS CLI
4. Learn basic AWS CLI syntax
5. Learn parameters and options
6. Practice output formatting and filtering
7. Learn AWS CLI help and service discovery
8. Practice EC2, IAM, and S3 commands
9. Explore CloudTrail for account activity
10. Explore CloudWatch for monitoring and logs
11. Explore GuardDuty for threat detection
12. Practice AWS CLI scripting and automation
13. Apply secure credential and IAM practices

---

# Repository Contents

```text
AWS Security Monitoring & CLI
│
├── Security Monitoring
│   ├── Amazon GuardDuty
│   ├── Amazon CloudWatch
│   └── AWS CloudTrail
│
├── AWS CLI
│   ├── Installation
│   ├── Configuration
│   ├── Command Syntax
│   ├── Parameters
│   ├── Output Formats
│   ├── Filtering
│   ├── JMESPath
│   ├── Pagination
│   ├── Service Discovery
│   ├── EC2
│   ├── IAM
│   ├── S3
│   ├── Scripting
│   ├── Automation
│   ├── CI/CD
│   ├── Error Handling
│   └── Security Practices
│
└── Installation Scripts
    ├── Linux
    └── Windows
```

---

## Additional AWS Documentation

The detailed AWS CLI document includes references to AWS documentation, user guides, command examples, and service-specific resources for continued learning.

---

## Disclaimer

This repository is intended for **learning, documentation, and practical AWS administration/security practice**.

Always review IAM permissions, AWS resource impact, and potential costs before executing commands that create, modify, or delete AWS resources.
