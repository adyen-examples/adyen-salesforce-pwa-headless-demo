#!/bin/bash

# Function to check if a variable is set
check_var() {
    if [[ -z ${!1+x} ]]; then
        echo "Error: Required environment variable '$1' is not set."
        exit 1
    fi
}

# Check if any variable name ends with ADYEN_API_KEY
if [[ -n $(compgen -v | grep 'ADYEN_API_KEY$') ]]; then
    # Check if any variable name ends with ADYEN_CLIENT_KEY
    if [[ -n $(compgen -v | grep 'ADYEN_CLIENT_KEY$') ]]; then
        # Check if any variable name ends with ADYEN_MERCHANT_ACCOUNT
        if [[ -n $(compgen -v | grep 'ADYEN_MERCHANT_ACCOUNT$') ]]; then
            # All ADYEN variables are set, now check other required variables
            check_var "COMMERCE_API_CLIENT_ID"
            check_var "COMMERCE_API_ORG_ID"
            check_var "COMMERCE_API_SHORT_CODE"
            check_var "COMMERCE_API_SITE_ID"
            check_var "COMMERCE_API_DEFAULT_SITE"
            check_var "SCAPI_URL"
            check_var "OCAPI_URL"
            check_var "ENVIRONMENT_ID"
            check_var "PROJECT_ID"
            
            # All required variables are set
            echo "All required environment variables are set. Proceeding with npm install..."
            npm install
            npm run start
            exit 0
        else
            echo "Error: Required environment variable 'YOUR_SITE_ID_ADYEN_MERCHANT_ACCOUNT' is not set."
            exit 1
        fi
    else
        echo "Error: Required environment variable 'YOUR_SITE_ID_ADYEN_CLIENT_KEY' is not set."
        exit 1
    fi
else
    echo "Error: Required environment variable 'YOUR_SITE_ID_ADYEN_API_KEY' is not set."
    exit 1
fi
