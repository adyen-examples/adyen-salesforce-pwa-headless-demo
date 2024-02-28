# Adyen Salesforce PWA Headless Integration demo

Adyen Payments Headless Integration with Salesforce Composable Storefront for B2C Commerce demo. This application is a demonstration tool designed to showcase some features and capabilities of Adyen Salesforce PWA integration. 

## Before you begin

Before you start this demo, make sure that:

1. You have created an Adyen Test Account
2. You have a Salesforce sandbox connected to your Salesforce Commerce Cloud (SFCC) instance.
2. You have set up and know where to find [configuration values for your local environment](https://developer.salesforce.com/docs/commerce/pwa-kit-managed-runtime/guide/setting-up-your-local-environment.html#configuration-values).


> :warning: **Important Notice:** This application is not intended for production use. While the application demonstrates key functionalities, it has not been developed with the robustness, security, compatibility, and scalability necessary for production environments.


## Quick online demo with [Gitpod](https://gitpod.io/)

1. You need your Test API credentials. Navigate to the [Adyen Customer Area](https://ca-test.adyen.com/ca/ca/overview/default.shtml) and create a set of [API keys](https://docs.adyen.com/user-management/how-to-get-the-api-key).
2. Go to [gitpod account variables](https://gitpod.io/variables) and set the required variables below. Replace `YOUR_SITE_ID` in the variables with your Salesforce Site ID, this value is identical to the value you have for `COMMERCE_API_SITE_ID` f.e. `RefArch_ADYEN_API_KEY` where `RefArch` is your Site ID. This is a one-time setup.
```shell
    YOUR_SITE_ID_ADYEN_API_KEY="YOUR_ADYEN_API_KEY"
    YOUR_SITE_ID_ADYEN_MERCHANT_ACCOUNT="YOUR_ADYEN_MERCHANT_ACCOUNT"
    YOUR_SITE_ID_ADYEN_CLIENT_KEY="YOUR_ADYEN_CLIENT_KEY"

    COMMERCE_API_CLIENT_ID="YOUR_MRT_COMMERCE_API_CLIENT_ID"
    COMMERCE_API_ORG_ID="YOUR_MRT_COMMERCE_API_ORG_ID"
    COMMERCE_API_SHORT_CODE="YOUR_MRT_COMMERCE_API_SHORT_CODE"
    COMMERCE_API_SITE_ID="RefArch"
    COMMERCE_API_DEFAULT_SITE="RefArch"
    SCAPI_URL="*.api.commercecloud.salesforce.com"
    OCAPI_URL="*-123.sandbox.xx00.dx.commercecloud.salesforce.com"
    ENVIRONMENT_ID="YOUR_MRT_ENVIRONMENT_ID"
    PROJECT_ID="adyen-salesforce-pwa-demo"
```

Recommended additional variables;
```shell
    COMMERCE_API_CLIENT_ID_PRIVATE="YOUR_COMMERCE_API_CLIENT_ID"
    COMMERCE_API_CLIENT_SECRET="YOUR_COMMERCE_API_CLIENT_SECRET"
    SFCC_REALM_ID="YOUR_SFCC_REALM_ID"
    SFCC_INSTANCE_ID="YOUR_SFCC_INSTANCE_ID"
    SFCC_OAUTH_SCOPES="sfcc.orders sfcc.orders.rw"
```

 To setup webhooks, add the following variables;

```shell
    YOUR_SITE_ID_ADYEN_WEBHOOK_USER="YOUR_ADYEN_WEBHOOK_USERNAME"
    YOUR_SITE_ID_ADYEN_WEBHOOK_PASSWORD="YOUR_ADYEN_WEBHOOK_PASSWORD"
    YOUR_SITE_ID_ADYEN_HMAC_KEY="YOUR_ADYEN_HMAC_KEY"
```

3. Add `https://*.gitpod.io` to the list of allowed origin in the Customer Area settings of your Test API Credentials to make sure the UI can load the Drop-in and Components
 
4. Click the button below

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adyen-examples/adyen-salesforce-pwa-headless-demo/tree/develop)


## Run demo locally

You can run this application locally.

### Requirements:

- Node v18 or later
- npm v9 or later

### 1. Installation

```
git clone https://github.com/adyen-examples/adyen-salesforce-pwa-headless-demo.git
```

### 2. Set the environment variables

1. Create a `./.env` file with your environment variables. 
- Copy the `./.env.example` file and rename the file to .env.

2. Set the variables in the .env file. Replace `YOUR_SITE_ID` in the variables with your Salesforce Site ID, this value is identical to the value you have for `COMMERCE_API_SITE_ID` f.e. `RefArch_ADYEN_API_KEY` where `RefArch` is your Site ID.

### 3. Configure allowed origins (CORS)

It is required to specify the domain or URL of the web applications that will make requests to Adyen.

In the Customer Area add `http://localhost:3000` in the list of Allowed Origins associated with the Client Key.


### 4. Run the application

```
npm install
npm run start
```

Visit [http://localhost:8080/](http://localhost:8080/) to view storefront and make a test payment.

Try out the different payment methods with our [test card numbers](https://docs.adyen.com/development-resources/test-cards/test-card-numbers) and other payment method details.
