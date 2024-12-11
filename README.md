# IP Address Tracker

This project is an IP Address Tracker app built with Flutter. It allows users to track the geographical details of any IP address, including location, timezone, and ISP information. The app integrates Google Maps to display the IP location visually.

![App Demo](assets/demo.jpg)

## Prerequisites

Before you can run this app, ensure you have the following installed on your development machine:

- Flutter SDK (latest stable version)
- Android Studio or Visual Studio Code with Flutter plugins
- An API key for the IP Geolocation service
- A Google Maps API Key

## Setup Instructions

### 1. Obtain API Keys

#### a. IP Geolocation API Key

Navigate to the [IP Geolocation API documentation](https://geo.ipify.org/docs) and sign up for an account to get your API key.

#### b. Google Maps API Key

Go to the [Google Cloud Console](https://console.cloud.google.com/), create a new project, and enable the "Maps SDK for Android". Generate an API key for your project.

### 2. Configure API Keys in the Project

#### a. Add Google Maps API Key

1. Navigate to the `android/local.properties` file in your project.
2. Add the following line to specify your Google Maps API key:

   ```properties
   MAPS_API_KEY=your_google_maps_api_key
   ```

#### b. Add IP Geolocation API Key

1. Open `lib/src/shared/utils/strings.dart`.
2. Declare your IP Geolocation API key as follows:

   ```dart
   const yourApiKey = 'your_ip_geolocation_api_key';
   ```

### 3. Run the Application

After configuring the API keys:

1. Ensure you have an emulator running or a physical device connected.
2. Run the following command in the terminal:

   ```bash
   flutter pub get
   flutter run
   ```

## Features

- **IP Address Search**: Enter an IP address to get detailed information, including location, timezone, and ISP.
- **Google Maps Integration**: View the IP address's location on a map.
- **Error Handling**: Displays user-friendly error messages for invalid IP addresses or network issues.
