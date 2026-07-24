#!/bin/bash
echo -n "How many key-pairs would you like to generate: "
read count

mkdir -p "pub-keys/"

for ((i=1;i<=count;i++))
do
echo -n  "Enter a name: "
read name
echo -n "Enter an email: "
read email

gpg --batch --full-generate-key <<EOF
Key-Type: RSA
Key-Length: 2048
Name-Real: ${name}
Name-Email: ${email}
Expire-Date: 0
Passphrase: ''
%commit
EOF
echo "Key pair generated"
gpg --armor --output "pub-keys/${name}-public.txt" --export ${email}
done

