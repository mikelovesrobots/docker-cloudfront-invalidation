This docker container is used to create cache invalidations for AWS Cloudfront Distributions. It does so with the AWS cli. It creates the invalidation, gets the invalidation id, and then waits until that invalidation has completed before exiting.

# Use

```
docker run --rm \
  -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
  -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
  -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
  -e "DISTRIBUTION_ID=${DISTRIBUTION_ID}" \
  tozny/cloudfront-invalidation 
```
