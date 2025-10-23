# Adyen Salesforce Composable Storefront (PWA) demo

This repository showcases an integration example of some features and capabilities of Adyen Payments integration with Salesforce Composable Storefront (PWA) for B2C Commerce.

## Before you begin

Before you start this demo, make sure that:

1. You have created an Adyen Test Account
2. You have a Salesforce sandbox connected to your Salesforce Commerce Cloud (SFCC) instance. You can create an [on-demand sandbox](https://developer.salesforce.com/docs/commerce/pwa-kit-managed-runtime/guide/creating-an-on-demand-sandbox.html).
3. You have set up your sites and [SLAS](https://developer.salesforce.com/docs/commerce/commerce-api/guide/authorization-for-shopper-apis.html) for Composable Storefront.
4. You have set up and know where to find [configuration values for your local environment](https://developer.salesforce.com/docs/commerce/pwa-kit-managed-runtime/guide/setting-up-your-local-environment.html#configuration-values).

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
