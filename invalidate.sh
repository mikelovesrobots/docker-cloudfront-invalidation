#! /bin/sh

# check env vars are not empty
echo "${DISTRIBUTION_ID:?"Need to set Cloudfront Distribution id"}" > /dev/null
echo "${AWS_ACCESS_KEY_ID:?"NEED TO SET AWS ACCESS KEY ID"}" > /dev/null
echo "${AWS_SECRET_ACCESS_KEY:?"NEED TO SET AWS SECRET KEY"}" > /dev/null
echo "${AWS_DEFAULT_REGION:?"Need to set AWS region"}" > /dev/null

aws configure set preview.cloudfront true

echo "Creating invalidation for Distribution: $DISTRIBUTION_ID"
invalidation=$(aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*")
invalidation_id=$(echo $invalidation | jq -r '.Invalidation.Id')
echo "Created Invalidation. Invalidation ID: $invalidation_id"

aws configure set preview.cloudfront true

aws cloudfront wait invalidation-completed --distribution-id $DISTRIBUTION_ID --id $invalidation_id

echo "Invalidation ID: $invalidation_id for distribution: $DISTRIBUTION_ID was successful."
