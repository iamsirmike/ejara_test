# crypto_app

Crypto App.

## Getting Started

This project is a take home test for Ejara.

A few things to note:

- Login experience is simulated (use email: mike@gmail.com and password: 12345)
- Network calls are made to get the latest block for bitcoin and it's transactions
- You can pull to refresh on the home page to get the latest bitcoin block.
- Tezos blocks had no transactions coming in so I showed empty state instead.
- Rest of the coins were implemented to use same endpoint as the bitcoin (making network calls follow the same pattern)
- Flutter version 2.2.3

Plugins used:

- Provider for statemanagement
- Get_it for dependency injection
- Http for API calls

How to run:

- clone the project
- run flutter pub get
- ctrl + F5
