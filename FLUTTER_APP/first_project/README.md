# My First Project - Flutter App

This is a simple Flutter project that displays an interface with two images inside containers arranged horizontally, along with a description text below the images. The purpose of this app is to demonstrate the use of widgets like `Container`, `Row`, `Column`, and `Image` to build user interfaces.

## Description

![App Screenshot]()
- **AppBar**: Contains the title "My First Project" with custom text styling and background color.
- **Body**: 
  - A `Row` widget that displays two images inside `Container` widgets with a background color.
    - One image is loaded from the project’s asset files.
    - One image is loaded from the internet using `NetworkImage()`.
  - A `Column` widget that contains a text description of the displayed images.
  - The images are placed in the same row with a gap between them.
  - Below the images, a text "The two images are displayed" is displayed, with customized font size, font family (Suwannaphum-Regular), text color, and bold style.

## Features

- Display a title at the top of the page: `"My First Project"` using the `AppBar`.
- Add two images:
  1. One image loaded from the project’s asset files.
  2. One image loaded from the internet.
- Place the images in the same row with a gap between them.
- Below the images, display a text: `"The two images are displayed"`.
- Customize the text by changing:
  - Font size.
  - Font family (`Suwannaphum-Regular`).
  - Text color.
  - Make the text bold.
- Ensure there is a gap between the images and the text.
- Ensure that the two images and the text are centered in the middle of the screen.

## Instructions

### To run the app:

1. Clone the project via Git:
   ```bash
   git clone https://github.com/username/repository.git
