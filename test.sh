#!/bin/zsh

echo "Checking if required environment variables are set ..."

required_vars=(RefArch_ADYEN_API_KEY RefArch_ADYEN_MERCHANT_ACCOUNT RefArch_ADYEN_CLIENT_KEY COMMERCE_API_CLIENT_ID COMMERCE_API_ORG_ID COMMERCE_API_SHORT_CODE COMMERCE_API_SITE_ID COMMERCE_API_DEFAULT_SITE SCAPI_URL OCAPI_URL ENVIRONMENT_ID PROJECT_ID)

for tvar in "${required_vars[@]}"; do
  if [ ! -z "${tvar+x}" ]; then
    echo "Error: Expected environment variable '$tvar' not found. Please set all required environment variables $required_vars"
    exit 1
  fi
done