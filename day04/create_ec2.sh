#!/bin/bash

# Check AWS CLI
check_awscli() {
    command -v aws >/dev/null 2>&1
}

# Install AWS CLI (basic placeholder)
install_awscli() {
    echo "AWS CLI not installed. Please install AWS CLI manually."
    return 1
}

# Create EC2 instance
create_ec2_instance() {
    local AMI_ID=$1
    local INSTANCE_TYPE=$2
    local KEY_NAME=$3
    local SUBNET_ID=$4
    local SECURITY_GROUP_IDS=$5
    local INSTANCE_NAME=$6

    aws ec2 run-instances \
        --image-id "$AMI_ID" \
        --instance-type "$INSTANCE_TYPE" \
        --key-name "$KEY_NAME" \
        --subnet-id "$SUBNET_ID" \
        --security-group-ids "$SECURITY_GROUP_IDS" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]"
}

# Main function
main() {

    if ! check_awscli; then
        install_awscli || exit 1
    fi

    echo "Creating EC2 instance..."

    AMI_ID="ami-06e3c045d79fd65d9"
    INSTANCE_TYPE="t2.micro"
    KEY_NAME="shell-scripting-for-devops-key"
    SUBNET_ID="subnet-083caf2a31f0c3cfb"
    SECURITY_GROUP_IDS="sg-0ec029dceaf3e3c58"
    INSTANCE_NAME="Shell-Script-EC2-Demo"

    create_ec2_instance "$AMI_ID" "$INSTANCE_TYPE" "$KEY_NAME" "$SUBNET_ID" "$SECURITY_GROUP_IDS" "$INSTANCE_NAME"

    echo "EC2 instance creation completed."
}

main "$@"

