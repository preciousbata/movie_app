# Moviezzzz

An online movie streaming mobile application

## Packages

The following packages are used in this project:

### http

**Package description:** The `http` package provides a convenient way to make HTTP requests in Flutter applications. It offers a high-level API for sending HTTP requests and handling responses, making it easy to communicate with web servers and consume RESTful APIs.

**Usage:**

```dart
dependencies:
  http: ^version_number
```

### get_it

**Package description:** The `get_it` package is a simple service locator for Dart and Flutter projects. It allows for the easy management of dependency injection and provides a way to locate and retrieve instances of registered services or objects.

**Usage:**

```dart
dependencies:
  get_it: ^version_number
```

### flutter_bloc

**Package description:** The `flutter_bloc` package is a state management library for Flutter applications. It provides a predictable state management pattern, known as BLoC (Business Logic Component), which separates the presentation layer from the business logic and state management. It helps in building reactive and maintainable applications.

**Usage:**

```dart
dependencies:
  flutter_bloc: ^version_number
```

## Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/your/repository.git
   ```

2. Change to the project directory:

   ```shell
   cd project_directory
   ```

3. Install the required packages:

   ```shell
   flutter pub get
   ```

## Configuration

No additional configuration steps are required for the packages mentioned above.

## Usage

1. Import the necessary packages in your Dart files:

   ```dart
   import 'package:http/http.dart' as http;
   import 'package:get_it/get_it.dart';
   import 'package:flutter_bloc/flutter_bloc.dart';
   ```

2. Use the `http` package to make HTTP requests:

   ```dart
   // Perform a GET request
   http.Response response = await http.get('https://api.example.com/data');

   // Process the response
   if (response.statusCode == 200) {
     // Successful request
     print(response.body);
   } else {
     // Error handling
     print('Request failed with status: ${response.statusCode}');
   }
   ```

3. Utilize the `get_it` package to register and retrieve services or objects:

   ```dart
   // Register a service
   GetIt locator = GetIt.instance;
   locator.registerSingleton<MyService>(MyService());

   // Retrieve a service
   MyService service = locator<MyService>();
   ```

4. Use the `flutter_bloc` package to implement the BLoC pattern:

   ```dart
   // Define a state class
   class MyState extends Equatable {
     final String data;

     MyState(this.data);

     @override
     List<Object> get props => [data];
   }

   // Define an event class
   abstract class MyEvent extends Equatable {
     const MyEvent();

     @override
     List<Object> get props => [];
   }

   // Define a BLoC class
   class MyBloc extends Bloc<MyEvent, MyState> {
     MyBloc() : super(MyState('Initial Data'));

     @override
     Stream<MyState> mapEventToState(MyEvent event) async* {
       // Handle events and yield new states
       if (event is DataUpdatedEvent) {
         yield MyState(event.data);
       }
     }
   }

   // Usage example
   void main() {
     MyBloc myBloc = MyBloc();
     myBloc.add(DataUpdatedEvent('New Data'));
   }
   ```

## Yet to implement

1. Movie Search Functionality
2. Movie Streaming

## Contributing

Contributions are welcome! If you encounter any issues or would like
