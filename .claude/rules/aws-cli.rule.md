---
document_name: "aws-cli.rule.md"
location: ".claude/rules/aws-cli.rule.md"
codebook_id: "CB-RULE-AWS-001"
version: "1.0.0"
date_created: "2026-01-05"
date_last_edited: "2026-01-05"
document_type: "rule"
purpose: "Rules for safe and correct usage of AWS CLI"
cli_metadata:
  command: "aws"
  documentation_url: "https://docs.aws.amazon.com/cli/"
  version_check: "aws --version"
  install_docs: "https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
category: "rules"
status: "active"
tags:
  - "rule"
  - "cli"
  - "aws"
  - "cloud"
  - "infrastructure"
ai_parser_instructions: |
  This rule defines safe usage of AWS CLI.
  AWS operations can be very expensive and destructive.
  Always verify account, region, and resource targets.
---

# AWS CLI Rules

=== DOCUMENTATION ===
<!-- AI:DOCS:START -->

**Official Documentation**: https://docs.aws.amazon.com/cli/

| Resource | URL |
|----------|-----|
| CLI Reference | https://awscli.amazonaws.com/v2/documentation/api/latest/index.html |
| Configuration | https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html |
| IAM Best Practices | https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html |
| Pricing Calculator | https://calculator.aws/ |

**IMPORTANT**: Use WebFetch or WebSearch to review documentation for:
- Service-specific commands
- IAM policies and permissions
- Pricing before creating resources
- Region-specific features

<!-- AI:DOCS:END -->

---

=== SAFETY RULES ===
<!-- AI:SAFETY:START -->

### Critical Safety Guidelines

1. **ALWAYS verify account and region**
   ```bash
   aws sts get-caller-identity  # Which account?
   aws configure get region     # Which region?
   ```

2. **Cost awareness**
   - Many resources incur ongoing costs
   - Some operations have data transfer costs
   - Check pricing before provisioning

3. **IAM is powerful**
   - Can lock yourself out
   - Can grant excessive permissions
   - Use least privilege principle

4. **Deletion is often permanent**
   - S3 objects may be versioned
   - RDS has final snapshots
   - EC2 termination protection exists

### Never Do

```bash
# NEVER run without verifying account
aws ec2 terminate-instances --instance-ids i-xxx

# NEVER delete S3 buckets without checking
aws s3 rb s3://bucket-name --force

# NEVER modify IAM without review
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

# NEVER use root credentials
# NEVER commit credentials to code
```

### Pre-Flight Check

Before ANY AWS command:
```bash
# 1. Check current identity
aws sts get-caller-identity

# 2. Check region
aws configure get region

# 3. Check profile
echo $AWS_PROFILE
```

<!-- AI:SAFETY:END -->

---

=== COMMON COMMANDS ===
<!-- AI:COMMANDS:START -->

### Configuration

```bash
# Configure credentials
aws configure

# Configure specific profile
aws configure --profile PROFILE_NAME

# List profiles
aws configure list-profiles

# Use specific profile
aws --profile PROFILE_NAME COMMAND
export AWS_PROFILE=PROFILE_NAME
```

### S3

```bash
# List buckets
aws s3 ls

# List bucket contents
aws s3 ls s3://bucket-name/

# Copy file to S3
aws s3 cp file.txt s3://bucket-name/

# Sync directory
aws s3 sync ./dir s3://bucket-name/

# Download file
aws s3 cp s3://bucket-name/file.txt ./
```

### EC2

```bash
# List instances
aws ec2 describe-instances

# List running instances
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"

# Start/stop instance
aws ec2 start-instances --instance-ids i-xxx
aws ec2 stop-instances --instance-ids i-xxx
```

### Lambda

```bash
# List functions
aws lambda list-functions

# Invoke function
aws lambda invoke --function-name FUNCTION_NAME output.json

# View logs (last 5 minutes)
aws logs filter-log-events --log-group-name /aws/lambda/FUNCTION_NAME --start-time $(date -d '5 minutes ago' +%s000)
```

### IAM

```bash
# List users
aws iam list-users

# Get current user
aws iam get-user

# List roles
aws iam list-roles
```

### CloudFormation

```bash
# List stacks
aws cloudformation list-stacks

# Describe stack
aws cloudformation describe-stacks --stack-name STACK_NAME

# Deploy stack (with review!)
aws cloudformation deploy --template-file template.yaml --stack-name STACK_NAME
```

<!-- AI:COMMANDS:END -->

---

=== DANGEROUS OPERATIONS ===
<!-- AI:DANGEROUS:START -->

### Require User Confirmation

| Command | Risk | Before Running |
|---------|------|----------------|
| `ec2 terminate-instances` | Permanent instance deletion | Check instance ID |
| `s3 rb --force` | Deletes bucket and contents | Verify bucket name |
| `rds delete-db-instance` | Database deletion | Check snapshots |
| `cloudformation delete-stack` | Deletes all resources | Review resources |
| `iam delete-*` | Security impact | Check dependencies |

### Cost Implications

| Service | Cost Risk |
|---------|-----------|
| EC2 instances | Hourly compute costs |
| RDS instances | Hourly database costs |
| NAT Gateway | Hourly + data transfer |
| Data Transfer | Egress charges |
| S3 | Storage + requests |

Always inform user of potential costs before provisioning.

### Dry Run Option

Many EC2 commands support `--dry-run`:
```bash
aws ec2 run-instances --dry-run --image-id ami-xxx ...
```

<!-- AI:DANGEROUS:END -->

---

=== AUTHENTICATION ===
<!-- AI:AUTH:START -->

### Credential Methods (in order of precedence)

1. **Environment Variables** (CI/CD)
   ```bash
   export AWS_ACCESS_KEY_ID=xxx
   export AWS_SECRET_ACCESS_KEY=xxx
   export AWS_SESSION_TOKEN=xxx  # If using STS
   ```

2. **AWS Profiles** (~/.aws/credentials)
   ```ini
   [default]
   aws_access_key_id = xxx
   aws_secret_access_key = xxx

   [production]
   aws_access_key_id = xxx
   aws_secret_access_key = xxx
   ```

3. **IAM Roles** (EC2, Lambda, ECS)
   - Automatic, no configuration needed
   - Preferred for AWS resources

### SSO Login

```bash
# Configure SSO
aws configure sso

# Login
aws sso login --profile PROFILE_NAME
```

### Never Do

```bash
# NEVER commit credentials
# NEVER use root account for CLI
# NEVER share access keys
# NEVER hardcode credentials in scripts
```

<!-- AI:AUTH:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| "AccessDenied" | Insufficient permissions | Check IAM policies |
| "InvalidClientTokenId" | Bad credentials | Reconfigure credentials |
| "ExpiredToken" | Session expired | Refresh credentials |
| "ResourceNotFoundException" | Wrong region or deleted | Check region |
| "ThrottlingException" | Rate limit | Add delays/retry |

### Debugging

```bash
# Verbose output
aws --debug COMMAND

# Check configured region
aws configure get region

# Test credentials
aws sts get-caller-identity

# Check service quotas
aws service-quotas list-service-quotas --service-code SERVICE
```

<!-- AI:ERRORS:END -->

---

=== USED BY ===
<!-- AI:USEDBY:START -->

| Agent | Purpose |
|-------|---------|
| @agent(devops-engineer) @ref(CB-AGENT-DEVOPS-001) | Infrastructure management |
| @agent(backend-engineer) @ref(CB-AGENT-BACKEND-001) | Lambda, ECS deployments |

<!-- AI:USEDBY:END -->

---

=== RELATED RULES ===
<!-- AI:RELATED:START -->

| Rule | Relationship |
|------|--------------|
| @rule(gcloud-cli) | Alternative cloud provider |
| @rule(docker-cli) | ECR container images |
| @skill(infrastructure) | Infrastructure management |

<!-- AI:RELATED:END -->
