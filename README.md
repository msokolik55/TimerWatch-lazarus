# Countdown Clock in Pascal

## Overview

This Pascal program creates a countdown clock with customizable input for minutes and seconds. It utilizes the `graph` unit for graphical output and provides an interactive interface for setting the countdown time.

## Features

-   Countdown clock display with minute and second hands.
-   User-friendly interface for setting countdown time.
-   Dynamic color change in the clock as the countdown approaches.

## Getting Started

### Prerequisites

Before running the program, ensure that you have a Pascal compiler that supports the `graph` unit.

### Usage

1. Copy the program code into your Pascal environment.
2. Compile and run the program.

## Program Structure

The program is structured as follows:

-   `zadajHodnoty`: Procedure for inputting minute and second values.
-   `prevodRadiany`: Function for converting degrees to radians.
-   `hodiny`: Procedure for drawing the clock face with hour marks.
-   `cas`: Function for formatting the time in minutes and seconds.
-   `rucicka`: Procedure for drawing and erasing clock hands.
-   Countdown loop: Displays the countdown clock and updates every second.

## Screenshots

![Countdown Clock Screenshot](screenshot.png)

## Customization

-   Set the countdown time by inputting minutes and seconds when prompted.
-   Adjust the clock face appearance by modifying the parameters in the code.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
