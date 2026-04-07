#!/bin/bash
set -e

yum update -y
yum install -y python3

mkdir -p /home/ec2-user/app
cat > /home/ec2-user/app/index.html <<'EOF'
${html}
EOF
cat > /home/ec2-user/app/app.py <<'EOF'
${app_py}
EOF
chown -R ec2-user:ec2-user /home/ec2-user/app
nohup python3 /home/ec2-user/app/app.py > /home/ec2-user/app/server.log 2>&1 &
