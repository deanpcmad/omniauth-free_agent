# OmniAuth FreeAgent

An OmniAuth strategy for FreeAgent

## Installation

Add the OmniAuth FreeAgent and OmniAuth rails_csrf_protection gems to your Gemfile

```ruby
gem 'omniauth-free_agent'
gem 'omniauth-rails_csrf_protection'
```

## Usage

You can create an application on the [FreeAgent Developer Dashboard](https://dev.freeagent.com/) and get your app and secret keys.

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :free_agent, ENV["FREEAGENT_CLIENT"], ENV["FREEAGENT_SECRET"]
end
```

Or for the FreeAgent Sandbox:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :free_agent_sandbox, ENV["FREEAGENT_CLIENT"], ENV["FREEAGENT_SECRET"]
end
```

## Auth Hash

Here's an example Auth hash available in `request.env["omniauth.auth"]`:

```json
{
  "provider": "free_agent_sandbox",
  "uid": "https://api.sandbox.freeagent.com/v2/users/ID",
  "info": {
    "email": "test@test.com",
    "first_name": "Test",
    "last_name": "User",
    "name": "Test User"
  },
  "credentials": {
    "token": "abc123",
    "refresh_token": "123abc",
    "expires_at": 123123123,
    "expires": true
  },
  "extra": {
    "user": {
      "url": "https://api.sandbox.freeagent.com/v2/users/ID",
      "first_name": "Test",
      "last_name": "User",
      "hidden": false,
      "email": "test@test.com",
      "role": "Owner",
      "permission_level": 8,
      "opening_mileage": "0.0",
      "updated_at": "2024-08-12T14:15:01.000Z",
      "created_at": "2024-08-12T14:09:02.000Z"
    },
    "company": {
      "company": {
        "url": "https://api.sandbox.freeagent.com/v2/company",
        "id": 22954,
        "name": "My Company",
        "subdomain": "mycompany",
        "type": "UkSoleTrader",
        "company_start_date": "2024-04-06",
        "currency": "GBP",
        "mileage_units": "miles",
        "short_date_format": "dd mmm yy",
        "freeagent_start_date": "2024-04-06",
        "first_accounting_year_end": "2025-04-05",
        "annual_accounting_periods": [
          {
            "starts_on": "2024-04-06",
            "ends_on": "2025-04-05"
          }
        ],
        "address1": "1 A Road",
        "town": "2 A Town",
        "postcode": "AA11 1AA",
        "country": "United Kingdom",
        "locale": "en",
        "business_category": "Software Development",
        "cis_enabled": false,
        "locked_attributes": [
          "currency"
        ],
        "created_at": "2024-08-12T14:09:02.000Z",
        "updated_at": "2024-08-12T14:09:46.000Z",
        "sales_tax_registration_status": "Not Registered",
        "ec_vat_reporting_enabled": false,
        "sales_tax_name": "VAT",
        "sales_tax_effective_date": "2024-04-06",
        "sales_tax_rates": [
          "20.0",
          "5.0",
          "0.0"
        ],
        "supports_auto_sales_tax_on_purchases": true,
        "initially_on_frs": false,
        "sales_tax_is_value_added": true,
        "initial_vat_basis": "Invoice"
      }
    }
  }
}
```
