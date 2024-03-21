# Adyen Salesforce Composable Storefront (PWA) demo

This repository showcases an integration example of some features and capabilities of Adyen Payments integration with Salesforce Composable Storefront (PWA) for B2C Commerce.

## Before you begin

Before you start this demo, make sure that:

1. You have created an Adyen Test Account
2. You have a Salesforce sandbox connected to your Salesforce Commerce Cloud (SFCC) instance. You can create an [on-demand sandbox](https://developer.salesforce.com/docs/commerce/pwa-kit-managed-runtime/guide/creating-an-on-demand-sandbox.html).
3. You have set up your sites and [SLAS](https://developer.salesforce.com/docs/commerce/commerce-api/guide/authorization-for-shopper-apis.html) for Composable Storefront.
4. You have set up and know where to find [configuration values for your local environment](https://developer.salesforce.com/docs/commerce/pwa-kit-managed-runtime/guide/setting-up-your-local-environment.html#configuration-values).

You can run this demo in 2 ways: using an Open Source online workspace ([Gitpod](https://github.com/adyen-examples/adyen-salesforce-pwa-headless-demo/tree/main?tab=readme-ov-file#quick-online-demo-with-gitpod)) or on your [local machine](https://github.com/adyen-examples/adyen-salesforce-pwa-headless-demo/tree/main?tab=readme-ov-file#run-demo-locally).

> :warning: **Important Notice:** This application is not intended for production use. While the application demonstrates key functionalities, it has not been developed with the robustness, security, compatibility, and scalability necessary for production environments.

## Quick online demo with [Gitpod](https://gitpod.io/)

### 1. Set the environment variables in Gitpod

1. Get your Test API credentials ready. Don't have an Adyen API Key? Log in to your [Customer Area](https://ca-test.adyen.com/), Go to **Developers** > **API credentials**, and create a set of API Credendials for your integration.
2. Get all the required environment variables below, append the value of `COMMERCE_API_SITE_ID` with all Adyen environment variable names. For example, if your `COMMERCE_API_SITE_ID` is `RefArch`, your `ADYEN_API_KEY` should be `RefArch_ADYEN_API_KEY`. Go to [gitpod account variables](https://gitpod.io/variables) and add all required variables. This is a one-time setup.

```shell
    RefArch_ADYEN_API_KEY="YOUR_ADYEN_API_KEY"
    RefArch_ADYEN_MERCHANT_ACCOUNT="YOUR_ADYEN_MERCHANT_ACCOUNT"
    RefArch_ADYEN_CLIENT_KEY="YOUR_ADYEN_CLIENT_KEY"

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

3. To setup webhooks, add the following variables to Gitpod. (Set scope: `adyen-examples/*`)

```shell
    RefArch_ADYEN_WEBHOOK_USER="YOUR_ADYEN_WEBHOOK_USERNAME"
    RefArch_ADYEN_WEBHOOK_PASSWORD="YOUR_ADYEN_WEBHOOK_PASSWORD"
    RefArch_ADYEN_HMAC_KEY="YOUR_ADYEN_HMAC_KEY"
```

4.  Optional additional variables;

```shell
    COMMERCE_API_CLIENT_ID_PRIVATE="YOUR_COMMERCE_API_CLIENT_ID"
    COMMERCE_API_CLIENT_SECRET="YOUR_COMMERCE_API_CLIENT_SECRET"
    SFCC_REALM_ID="YOUR_SFCC_REALM_ID"
    SFCC_INSTANCE_ID="YOUR_SFCC_INSTANCE_ID"
    SFCC_OAUTH_SCOPES="sfcc.orders sfcc.orders.rw"
```

### 2. Configure allowed origins (CORS) for Gitpod

1. In the Customer Area, add `https://*.gitpod.io` to the list of Allowed Origins associated with the Client Key to make sure the UI can load the Drop-in and Components
2. In the redirect field of [SLAS UI Admin](https://developer.salesforce.com/docs/commerce/commerce-api/guide/authorization-for-shopper-apis.html#create-a-slas-client) Client settings, append a `|` character followed by `https://*.gitpod.io/callback`

```shell
    http://127.0.0.1:3000/callback|http://localhost:3000/callback|https://*.mobify-storefront.com/callback|https://*.gitpod.io/callback
```

### 3. Launch the demo on Gitpod

1. Click the button below
2. Click **Continue** to open with the default Gitpod Workspace.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adyen-examples/adyen-salesforce-pwa-headless-demo/tree/main)

## Run demo on local

You can run this demo on your local machine.

### Requirements:

-   Node v18 or later
-   npm v9 or later

### 1. Installation

```
    git clone https://github.com/adyen-examples/adyen-salesforce-pwa-headless-demo.git
```

### 2. Set the environment variables

1. Create a `./.env` file with your environment variables.

-   Copy the `./.env.example` file and rename the file to .env.

2. Set the variables in the .env file. Replace `YOUR_SITE_ID` in the variables with your Salesforce Site ID, this value is identical to the value you have for `COMMERCE_API_SITE_ID` f.e. `RefArch_ADYEN_API_KEY` where `RefArch` is your Site ID.

### 3. Configure allowed origins (CORS)

It is required to specify the domain or URL of the web applications that will make requests to Adyen.

In the Customer Area add `http://localhost:3000` to the list of Allowed Origins associated with the Client Key.

### 4. Run the application

```
    npm install
    npm run start
```

Visit [http://localhost:3000/](http://localhost:3000/) to view storefront and make a test payment.

Try out the different payment methods with our [test card numbers](https://docs.adyen.com/development-resources/test-cards/test-card-numbers) and other payment method details.

## Webhook setup

In the Customer Area under the `Developers → Webhooks` section, [create](https://docs.adyen.com/development-resources/webhooks/#set-up-webhooks-in-your-customer-area) a new `Standard webhook`.

A good practice is to set up basic authentication, copy the generated HMAC Key and set it as an environment variable. The application will use this to verify the [HMAC signatures](https://docs.adyen.com/development-resources/webhooks/verify-hmac-signatures/).

Make sure the webhook is **enabled**, so it can receive notifications.

### Expose an endpoint

This demo provides a simple webhook implementation exposed at `/api/webhooks/notifications` that shows you how to receive, validate and consume the webhook payload.

### Test your webhook

The following webhooks `events` should be enabled:

-   **AUTHORISATION**

To make sure that the Adyen platform can reach your application, we have written a [Webhooks Testing Guide](https://github.com/adyen-examples/.github/blob/main/pages/webhooks-testing.md)
that explores several options on how you can easily achieve this (e.g. running on localhost or cloud).

## Contributing

We commit all our new features directly into our GitHub repository. Feel free to request or suggest new features or code changes yourself as well!

Find out more in our [Contributing](https://github.com/adyen-examples/.github/blob/main/CONTRIBUTING.md) guidelines.

## License

MIT license. For more information, see the **LICENSE** file in the root directory.
