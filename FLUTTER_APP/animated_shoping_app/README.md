# animated_shoping_app 
## Requirement 1:

Title: add animation to your app
Description: add an animation after clicking the close button in the dialog after signing up successfully that makes the sign up page fade out 
and the shopping page fades in.

## Requirement 2:

Title: Add Arabic language to your app
Description: in this task, you are asked tod change the titles , and the sections of the shopping page like ""our products"" , ""hot offers"" and the up page 
content using localization.
## Flutter Fade Transition Example

This project demonstrates how to use a fade transition when navigating between two pages in Flutter. Upon tapping a close button, the current page fades out, and the second page fades in with an animated transition.

## Method Description

### Objective:
Add an animation that makes the first page fade out and the second page fade in when navigating between two pages.

### Solution:
We use the `PageRouteBuilder` widget in Flutter to implement the fade transition. This allows us to customize the transition between two pages by specifying the type of animation we want, in this case, a fade effect.

### Code Explanation:

```dart
onTap: () {
  // Perform the fade-out animation for the current page
  Navigator.of(context).pop();
  
  // Use PageRouteBuilder to create a fade-in transition for the second page
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
      transitionDuration: Duration(seconds: 1),  // Duration of the transition
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Fade the current page out and the second page in
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
},


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
