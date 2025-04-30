![Flutter](https://img.shields.io/badge/Framework-Flutter-blue)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)
![State Management](https://img.shields.io/badge/State_Management-Provider-yellow)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

# Covid Grocery – A Flutter-Based Essential Services App

A cross-platform mobile application built using **Flutter** to assist users during the COVID-19 lockdown by identifying nearby grocery stores and essential service providers in Tamil Nadu, India. This was an initiative by the Tamil Nadu Government in collaboration with university students.

 [Live Demo + Project Walkthrough on LinkedIn](http://tiny.cc/covid-grocery-app)

---

## Features

This app was built to solve real-world challenges during COVID-19:
- Location-based store suggestions using Google Maps API
- View nearby grocery and medical stores within serviceable radius
- Inventory-based product listing from store owners
- Add-to-cart and request system for contactless pickup
- One-tap contact and navigation to selected stores
- COVID-awareness tips and community service guidelines

---

## Why This App?

During the first wave of the COVID-19 pandemic, many communities faced challenges in finding open grocery and pharmacy services due to lockdowns. This app was developed to:

- Connect users with verified essential service providers
- Reduce travel uncertainty and store-hopping
- Enable **digitally lightweight local commerce** in crisis conditions

---

## Tech Stack

| Category         | Tools & Frameworks                                   |
|------------------|------------------------------------------------------|
| **Language**     | Dart (Flutter 2.x)                                   |
| **Framework**    | Flutter (cross-platform mobile development)          |
| **State Mgmt**   | Provider                                              |
| **Backend**      | Firebase Firestore                                   |
| **APIs**         | Google Maps Platform, GeoLocator                     |
| **UI Design**    | Material Design Components (MDC), Flutter Widgets    |
| **IDE**          | VS Code, Android Studio                              |

---

## Setup Instructions

```bash
# Step 1: Clone this repo
git clone https://github.com/YOUR_USERNAME/covid-grocery.git
cd covid-grocery

# Step 2: Get dependencies
flutter pub get

# Step 3: Run the app
flutter run