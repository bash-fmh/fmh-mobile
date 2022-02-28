# fmh-mobile

## Objective

The goals and objectives for this project will focus on implementing mobile app that:
* Integrate v1, v1.5 and v2 into 1 single app
* Eliminate redundant multiple applications 
* Is implemented with flutter
* provides a reliable and flexible application with flutter 
* Is easy to scale 


## Timeline

Project started in Feb 28, 2022.

## Target Users

- Enterprise, Legacy and V2 Users

## Target Platforms

- mobile: <span dir="">Android</span> <span dir="">iOS</span>

## Target OS version

- Android: <span dir="">21</span> - <span dir="">30</span>
- iOS: <span dir="">12.1</span>


## Packages

- **shared_preferences**: Wraps platform-specific persistent storage for simple data.
- **flutter_pulltorefresh:** a widget for scroll component. pull up load and pull down refresh.
- **package_info:** for querying information about an application package.
- **firebase_messaging:** to use the [Firebase Cloud Messaging (FCM) API](https://firebase.google.com/docs/cloud-messaging/).
- **firebase_core:** to use the Firebase Core API, which enables connecting to multiple Firebase apps.
- **firebase_crashlytics:** to use the [Firebase Crashlytics API](https://firebase.google.com/docs/crashlytics/).
- **sentry_flutter:** Error Tracking

## <span dir="">Features</span>

- **<span dir="">Login:</span>** Currently the app is available for 3 group of users namely; Enterprise <span dir="">v1.5</span> , Legacy <span dir="">v1</span> & Version 2 <span dir="">v2</span>. \
  Anyone is able to download the app
    - **App Type Selection:**
    - After user download and installs the app, then the user will have to select application type to login (Enterprise, Legacy, V2)
    - Selecting app type will also determine type of login
      - **Enterprise**
        - Pizzahut
        - KFC
      - **V2**
        - Country Selection
        - Phone Number
        - OTP
      - **Legacy**
        - Admin
        - central kitchen
        - supplier 
        - Branch
        
  - **Login Screen:**
    - User will need to enter these information to log in depending on the type of app selected
      - Mobile Number
      - User name
      - Password
    - If mobile number and password does not match then show error message
      - Invalid username or password
    - If all information are correct then user will be able to log in successfully
    - Once user is logged in, the app retains login status so when user kills and opens app again, user will remain logged in
   

## How to run the app

The following command is used to run the app in **debug** mode for the following environments:

### > Android & IOS

- **Production**:

```
flutter run --flavor prod -t lib/main_prod.dart --dart-define=ENVDEFINE_BASE_URL_ENTERPRISE=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue
```

- **Development**:

```
flutter run --flavor dev -t lib/main_dev.dart --dart-define=ENVDEFINE_BASE_URL_ENTERPRISE=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue
```

- **UAT:**

```
flutter run --flavor uat -t lib/main_uat.dart --dart-define=ENVDEFINE_BASE_URL_ENTERPRISE=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue
```


## Submission

For new release, update the app version (name/code) before building the app.

### > Android

The following command to build **apk** in the following environments:

- **Production**:

```
flutter build apk --release --flavor prod -t lib/main_prod.dart --dart-define=ENVDEFINE_BASE_URL_ENTERPRISE=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue
```

- **Development**:

```
flutter build apk --release --flavor dev -t lib/main_dev.dart --dart-define=ENVDEFINE_BASE_URL_ENTERPRISE=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue
```

- **UAT:**

```
flutter build apk --release --flavor uat -t lib/main_uat.dart --dart-define=ENVDEFINE_BASE_URL_ENTERPRISE=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue
```

### > iOS

The following command to build **ipa** in the following environments:

- **Production**:

```
flutter build ios --release --flavor Release-Prod -t lib/main_prod.dart --dart-define=ENVDEFINE_BASE_URL_ENTERPRISE=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue
```

- **Development**:

```
flutter build ios --release --flavor Release-Dev -t lib/main_dev.dart --dart-define=ENVDEFINE_BASE_URL_ENTERPRISE=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue
```

- **UAT:**

```
flutter build ios --release --flavor Release-Uat -t lib/main_uat.dart --dart-define=ENVDEFINE_BASE_URL_ENTERPRISE=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue, --dart-define=ENVDEFINE_BASE_URL_LEGACY=theValue
```

To publish the app, follow [Apple’s App Store submission](https://developer.apple.com/app-store/review/guidelines/) ([more](https://clearbridgemobile.com/how-to-submit-an-app-to-the-app-store/)), [Google Play submission](https://support.google.com/googleplay/android-developer/answer/9859152?hl=en) ([more](https://clearbridgemobile.com/how-to-submit-an-app-to-the-google-play-store/)).

- **Apple Store:** 
- **Google Play Store**: 

## Acceptance Criteria

- All features must function with no error <span dir="">v1</span> <span dir="">v1.5</span> <span dir="">v2</span>
- App theme and context must be same as [wireframe](<https://www.figma.com/file/VpJVcRFAVH96E4X1SaPfYn/FMH-Mob.?node-id=248%3A21550>).


## API Endpoints

The following section describes all the API endpoints which been used in the app, to get access of services/functionality provided by FMH micro-services (MS) or web services.

### Below are those baseUrl use by the FlavorManager.

<span dir="">baseUrl</span> for <span dir="">DEV</span> & <span dir="">UAT</span>:

- [<span dir="">https://</span>]() <span dir="">Enterprise</span>
- [<span dir="">https://</span>]() <span dir="">Legacy</span>
- [<span dir="">https://</span>]() <span dir="">V2</span>

<span dir="">baseUrl</span> for <span dir="">PROD</span>:

- [<span dir=""></span>]() <span dir="">my</span>
- [<span dir=""></span>]() <span dir="">ID</span>
- [<span dir=""></span>]() <span dir="">TH</span>

An example of complete API request:

### Table of API Endpoints

All the endpoints listed in the table below needs to append <span dir="">baseUrl</span> in front of it before making API request to FMH server.

Example:


(Note: <span dir="">-</span> is not applicable)
| **Endpoint** | **Method** | **Path Variable** | **Query Parameter** | **Body** |
|--------------|------------|-------------------|---------------------|----------|
| <span dir="">/example/v4/login/</span> | GET | - | - | - |


## Changelog

| **Version**                                                                                                          | **Changes**                                                                                                                                              |
| -------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [v1.2.5](https://github.com/fmh/mobile/-/tags/v1.2.5)                                               | Resolved UI                                                                                                         |
                                                                                                                      |

## Contact Persons

- **PIC**: Bash<[bash.muhammed@foodmarkethub.com](mailto:bash.muhammed@foodmarkethub.com)>
- **Team members**:
  - Anom<[ade.anom@foodmarkethub.com](mailto:ade.anom@foodmarkethub.com)>
  - Jeffery<[jeffrey.hoa@foodmarkethub.com](mailto:jeffrey.hoa@foodmarkethub.com)>
  - Yean Loong<[yeanloong@foodmarkethub.com](mailto:yeanloong@foodmarkethub.com) >
  - Galang<[galang.lintar@foodmarkethub.com](mailto:galang.lintar@foodmarkethub.com)>
- **Product Owner**: <[](mailto:)>

## Diagrams

### > User Journey

[V2.5 (APP) - Figma > User Journey](<https://www.figma.com/file/VpJVcRFAVH96E4X1SaPfYn/FMH-Mob.?node-id=248%3A21550>)


## References

[Repository](https://github.com/bash-foodmarkethub/fmh-mobile.git)