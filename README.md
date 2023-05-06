# flutter_internet_connection_test


## Getting Started

# Check internet connection in your app.
Follow the steps : 

Step 1:-

For check Internet connection add these packages in your pubspec yaml file
  internet_connection_checker: ^0.0.1+4
  provider:
  
For check Internet speed add these packages in your pubspec yaml file
 http:
 
Step 2:-
wrap your material app with streamprovider like this 

StreamProvider<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      create: (_) {
        return InternetConnectionChecker().onStatusChange;
      },

step 3:-

Check specific widget for internet available or not like this
Provider.of<InternetConnectionStatus>(context) == InternetConnectionStatus.disconnected 
