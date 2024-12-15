#EzyStocks-frontend
EzyStocks is a Flutter-based application designed to simplify stock trading, including buying and selling of stocks. The app integrates an LSTM model for advanced stock price prediction, ensuring informed decision-making.

Key Features:

1. Secure Backend: Powered by Spring Boot, the app ensures robust and secure handling of all transactions and user data.
2. Bloc Clean Architecture: Implements Bloc architecture, adhering to industry best practices for scalable and maintainable code.
3. Interactive Graphical Displays: Showcases dynamic and complex visualizations of stock trends and data using the FL_Charts library.
EzyStocks delivers a seamless, intuitive experience for users engaging in the stock market.
4. Engaging Animations: Utilizes Lottie animations to enhance the user experience, making the interface visually appealing and interactive.


You can access the figma of the project here -
https://www.figma.com/design/cjaAsdeYFjXQ3RFjOyj2iO/EzyStocks?node-id=1-264&t=v2QrWisk6LVEwdJe-1

#This project is not deployed anywhere, so to check this out you have to run the code on your machine. Following is the step-by-step guide to run this code:

* Prerequisites

To run the flutter frontend seamlessly, make sure you have also EzyStocks Backend and EzyStocks ML running on your local machine:
https://github.com/anujjainwork/ezystocks-backend
https://github.com/anujjainwork/ezystocks-ML

Before starting, make sure you have the following installed:

1. Flutter: Install the latest version of Flutter from https://flutter.dev/docs/get-started/install.
2. Dart SDK: Dart comes bundled with Flutter, so no need to install it separately.
3. Android Studio or Visual Studio Code (VS Code): Recommended IDEs for Flutter development.
   - Install Android Studio from https://developer.android.com/studio or VS Code from https://code.visualstudio.com/.
4. Xcode (for iOS development): Required for macOS users to build and run iOS apps.
5. Git: To clone the repository, make sure you have Git installed.

* Steps to Run EzyStocks Flutter Project Locally

Step 1: Clone the Repository
1. Open a terminal or Git Bash.
2. Clone the repository using the following command:
   git clone https://github.com/yourusername/EzyStocks.git
3. Navigate to the project folder:
   cd EzyStocks

Step 2: Install Dependencies
1. In the project directory, run the following command to install all the required Flutter dependencies:
   flutter pub get
   This will download all necessary packages defined in the pubspec.yaml file.

Step 3: Set Up Android/iOS Emulator or Physical Device
1. Android Emulator:
   - Open Android Studio and create a new virtual device (AVD) if you haven't already.
   - Launch the emulator from Android Studio or use the terminal:
     flutter emulators --launch <emulator_id>
2. iOS Simulator (for macOS users):
   - Open Xcode, then run the simulator from the Xcode toolbar or use the terminal:
     open -a Simulator
3. Alternatively, connect a physical device to your computer via USB and enable Developer Mode.

Step 4: Run the App
1. In the terminal, make sure you're in the project directory.
2. To run the app on your connected emulator or device, use:
   flutter run
   This command will build and launch the app on your device/emulator.
3. If everything is set up correctly, the app should now be running on your local machine.

Step 5: Open the Project in Your IDE (Optional)
1. Open Android Studio or VS Code.
2. Open the EzyStocks folder from your IDE:
   - In VS Code, go to File > Open Folder and select the project folder.
   - In Android Studio, go to File > Open and choose the project folder.

Step 6: (Optional) Build and Run for Web
If you want to run the app in a web browser:
1. Make sure your Flutter installation supports web:
   flutter doctor
2. If the web environment is set up, run:
   flutter run -d chrome

Step 7: (Optional) Build the APK for Android
1. To build an APK for Android:
   flutter build apk --release

Troubleshooting Tips:
- If you encounter any issues with dependencies, try running:
  flutter clean
  flutter pub get
- Ensure that your Flutter installation is up to date:
  flutter upgrade
- Run flutter doctor to check if there are any missing dependencies or setup issues.

Conclusion
By following these steps, you should be able to successfully set up and run the EzyStocks Flutter project on your local machine.
