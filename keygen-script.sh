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
gpg --export --armor --output ${email} >> "${name}-public.txt"


