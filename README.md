# task_1_api_data_fetch

# Prayer Time App

Welcome to the Prayer Time App! This Flutter application helps users track prayer times throughout the day and provides a detailed view of prayer times for the entire month. The app is built using the GetX package for state management and utilizes the HTTP package to fetch data from an API.

## Features

- **Home Page:** Displays the following prayer times:
  - Fajr
  - Sunrise
  - Dhuhr
  - Asr
  - Sunset
  - Maghrib
  - Isha
  
  Users can select any prayer time to navigate to a detailed view.

- **Detailed View:** Upon selecting a prayer time on the home page, users are directed to a new page where:
  - The current month is displayed in both English and Arabic.
  - The date and day of the week are shown in both English and Arabic.
  - A list of prayer times for the entire month is presented for the selected prayer type (e.g., Fajr).

- **Data Fetching:** The app uses the HTTP package to fetch prayer time data from an API.

- **Refresh:** Users can refresh the data on the home page by performing a swipe-down gesture.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- Dependencies listed in `pubspec.yaml`

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/prayer-time-app.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd prayer-time-app
    ```

3. **Install dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the app:**

    ```bash
    flutter run
    ```

## Usage

- **Home Page:** View the prayer times for the current day and select a prayer time to see the monthly details.
- **Detailed View:** Explore the prayer times for the entire month, displayed in both English and Arabic.

## Screenshots

![Screenshot_20240817-104110](https://github.com/user-attachments/assets/2ed99e9b-bf19-4d5a-8db8-1377548a6ea8)
![Screenshot_20240817-012202](https://github.com/user-attachments/assets/81acdc08-e09e-49f3-a71c-ae3e2d0f7a01)
![Screenshot_20240817-012209](https://github.com/user-attachments/assets/5d4e6de3-0fbf-41d5-9582-dfe3392b7a0f)
![Screenshot_20240817-104046](https://github.com/user-attachments/assets/b5efe46c-6fe7-4ce5-8a4a-de9271b61a6d)
![Screenshot_20240817-104057](https://github.com/user-attachments/assets/aa5eeb17-207d-406c-9efd-96e9fe1c6253)

## APK Download

You can download the latest APK file from the [releases page](https://drive.google.com/file/d/1LKVBz73EAMHj2MXvntKehZvVqb-y0GgW/view?usp=sharing)
## API Integration

The app fetches data from a prayer times API. Make sure you have internet access to retrieve the latest prayer times.


## Acknowledgments

- [Flutter](https://flutter.dev/) - The framework used for development.
- [GetX](https://pub.dev/packages/get) - For state management.
- [HTTP Package](https://pub.dev/packages/http) - For making HTTP requests.

Feel free to open issues or submit pull requests if you find any bugs or have suggestions for improvements. Enjoy using the Prayer Time App!
