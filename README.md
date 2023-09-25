# Doctor Appointment Booking Application (Android, iOS & Web)

A demo project to see the list of doctors and book an appointment with them based on there availability 

## Packages

| Purpose           | Package               |
| ---------         | -------               |
| State management  |  Bloc                 |
| Data - HTTP       |  Dio                  |
| DI                |  Get it               |
| Routing           |  Go Router            |
| Responsive UI     |  Screen Utils         |

## Screens

- Home - Doctors List
  - Profile - Doctor Details
  - Select Package
  - Review
  - Booking Confirmation
  - My Bookings

 
## Project Architecture

The project is built using clean architecture. It has 2 main directories

- core
  - constants
  - di
  - router
  - usecases
  - utils
    
- features
  - data
  - domain
  - presentation

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
