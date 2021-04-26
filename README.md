# hearatale_literacy_app

Hearatale literacy app

Release Notes:
 - New Features:
    - The piggy bank screen displays the running total and rewards
    - All pink pig buttons connect to the piggy bank screen
    - The amount of rewards and methods to add coins are stored in the file called Rewards.dart
    - All quiz screens call the methods from Rewards.dart to add coins when appropriate
    - Word Structures screen with navigation icons created
    - Lessons have been created and linked to each icon on word structures screen
    - Sidebar with navigation functionality to quizzes, rewards, and audio replays implemented
    - Subsections in each lesson created
    - Overall section quizzes implemented
    - Quizzes for each subsection created
    - Login screen created and app now starts at this screen
    - Score menu screens created for each lesson and main word structures screen
    - Question answer steaks are now being tracked and input into score menu

 - Bug Fixes:
    - Some duplicate code has been extracted into a file called helper.dart
    - Image path and audio file path typos have been fixed
    - Question text for certain quizzes have been fixed
    - Quiz 6.8 sentence and answer options now appear and function properly
    - All screens and buttons are properly connected together
    - Text for certain score menus have been fixed
    - Overflow issues in certain screens have been fixed

 - Known Bugs and Defects:
    - There are no animations when coins are earned while taking quizzes
    - The lesson sentence and quiz question audio files for 4.2 are missing
    - From the Data Analytics Platform, student scores are unable to be displayed (not in the scope of this project)
    - There is no cumulative quiz for section 5 because there were no specifications for one in the word document

Install Guide:
 - Pre-requisites:
In order for the client to access the project, one of the pre-requisites it needs is to have Mac, Linux or Windows running in their computer for development. Followed by that, the Flutter framework must be installed and up and running, in this link (https://flutter.dev/docs/get-started/install) you will find the steps to download Flutter. Once Flutter is installed, to assure that it was done correctly, by running the command:flutter doctor in your terminal under the corresponding path. Last, you will need to have AndroidStudio installed, which you can find the guide of how to do so in this link (https://developer.android.com/studio/?gclid=Cj0KCQjw4ImEBhDFARIsAGOTMj_2pMD-nIDiYKepMGtck_ZL6SnePcnK1Ny0WW-dTgHYucxBKMDwWO4aAhw4EALw_wcB&gclsrc=aw.ds).

 - Dependent libraries that must be installed:
The dependent libraries that must be installed depend on if the user bought the application and has access to the Git repository or if the user is a student or teacher accessing the app. If the user is a student or teacher, no additional libraries are required for the user to download that are not included in the application itself. If the user has access to the Git repository and would like to access the source code, they would have to install Flutter, Android Studio, Android SDK, and AVD Manager.

 - Build instructions:
In order to run this application on a simulator, the client will need to use Android Studio’s built-in AVD manager. This simulates (virtually any) Android SDK. Android Studio’s AVD manager also supports running on a physical device without the program being installed on the actual phone itself.  
To support user’s downloading the application, the application would need to be put on the Android store following these steps: https://support.google.com/googleplay/android-developer/answer/9859152?hl=en. After being set up, users can download and work the app with no further action required. 

 - Installation of actual application:
All dependencies installations required to run the application are handled through Flutter’s package manager, and there are no further actions required by the user in order to get the application running. 

 - Download instructions:
In order to download the application, the user whether they are a teacher or a student must access their android application store and proceed to search for the application and download. After this, the user will be able to open and run the application. If the user is a customer and would like to view the source code, they can clone

 - Run instructions:
1) Open the Android Studio Application and click the 3rd Grade Literacy App Project on the left to open it
    - If you have created the project yet, then it will be necessary to first select “Open an existing project” on the right. From there, you will click on the       3rd Grade Literacy App folder that should be downloaded onto your computer.

2) Once you have opened the project, you will see a lot of folders containing the code on the left hand side. First, we will need to create a configuration     at the top. Select the configurations button at the top and click “Edit configurations” to add a new one.
 
3) The configuration that we will need to add will be for main.dart, the starting screen. In the “name” field type in “main.dart,” and when it asks for the file path, choose main.dart which should be located in ThirdGradeLiteracyApp > third-grade-literacy-frontend > lib  > main.dart. Finally, select “apply” and then “Ok.” 

4) Now that we have the configuration, we will need to open a device to view the app. Our team has been using the Android emulator provided by Android Studio. Select the AVD Manager button in the top left. It looks like a green android logo, and it will tell you the name if you hover the mouse over it.

5) Once you have opened the Android Virtual Device Manager, you should have a Google Pixel that you can begin using. Click the green play button on the right to launch it. You may receive an error that says “Unable to locate adb,” but you can simply hit “OK” and the device should still open. Once you have opened the enumalor phone, you may need to hit the power button at the top to turn it on, or hit the arrow buttons to rotate the phone. 

6) Turning on the phone should connect it to Android Studio, and you should now see a connected device to the left of the configuration at the top. It may take a moment if it’s the first time that you are opening the enumalor.

7) The last step will be to hit the green play button to the right of the configuration. A Run window will open and should start executing tasks such as “Running "flutter pub get" in third-grade-literacy-frontend…”, “Launching lib/main.dart on sdk gphone x86 arm in debug mode…”, and “Running Gradle task 'assembleDebug'...”. The last of these tasks will likely take the longest if it is your first time opening the emulator. Once they are complete, the app is ready to work at full capacity on the emulator!

 - Troubleshooting:
    - At one point, our team ran into an issue where we were getting errors due to “http” being in the code. We found that updating to the newest version of           Flutter fixed the issue. To do this, type “flutter upgrade” in the Terminal at the bottom right. For most group members, this solved the issue, but if it       still does not work, type “flutter clean” into the Terminal after flutter upgrade has finished running.

    - Some group members experienced an issue where certain dependencies could not be located and therefore the app could not run due to an error with locating       them. Although this will likely only happen if the .yaml file is edited, if you are experiencing a similar error, type “flutter pub get” into the               Terminal. This will update the dependencies and should resolve the error.

    - Although no one else in the group had this issue, one group member would get an error that says “error with building .gradle…” due to files that contained       a hashtag (#) in the name. He resolved this issue by renaming some of the files on his personal computer. If that gets rid of the error, it may be               necessary to alter the audio paths in their respective files. For example, if the audio file name for Lesson 2.6 is changed, then it will be necessary to       go into ThirdGradeLiteracyApp > third-grade-literacy-frontend > lib  > two > TwoPointSixLesson.dart and change the line that declares the name of the           audio to its new name. 

    - If the issue that you are having is not discussed anywhere in this document, always try to copy and paste what the error is saying into Google.                 Oftentimes, someone has had the same issue and the solution is posted on Stack Overflow or another website. It is often as simple as running a few               commands in the Terminal.
