Planet Information App

This Flutter application allows users to explore information about different planets in our solar system. It fetches data from an API and displays it in an interactive user interface.

Features

- ![](image1 (2).jpeg): The app fetches planet data from the API and creates a list of Planet objects, each representing a planet's name, image, description, mass, moons, rotation period, and atmosphere.

- *Navigation*: Users can navigate through the planets using next and previous buttons. The app displays the planet's image and some basic information about it.

- ![](image1 (2).jpeg): There is a "Show Details" button that is currently commented out but can be used to navigate to a detailed screen with more information about the selected planet.

- *Loading Screen*: While the data is being fetched from the API, a loading spinner is displayed to indicate that the app is loading data.

Code Structure

# `Planet` Class

The `Planet` class represents a planet and its attributes. It includes properties like `name`, `imagePath`, `description`, `mass`, `moons`, `rotation_period`, and `atmosphere`.

# `Planets` Widget

The `Planets` widget is the main component of the application. It is a `StatefulWidget` that manages the state of the app. It includes the following key components:

- `currentPlanetIndex`: Keeps track of the currently selected planet.

- `planetData`: Stores the data fetched from the API.

- `isLoading`: Indicates whether the app is currently loading data.

- `planets_list`: A list of `Planet` objects to store planet data.

- `getData()`: A method to fetch data from the API using the `NetworkHelper` class.

- `addPlanet()`: A method to parse the fetched data and create `Planet` objects, adding them to the `planets_list`.

- `buildPlanet(int nav)`: A method to navigate between planets when the next or previous buttons are pressed.

- `buildButton(int nav)`: A method to build buttons for navigation and display planet images.

- `initState()`: Initializes the app state by setting the `currentPlanetIndex` and fetching data when the widget is created.

- `build(BuildContext context)`: Defines the app's UI structure, including buttons for navigation, the planet image, and the loading spinner.

Usage

This Flutter app appears to be designed to display information about different planets, including their names, images, and other details and allows the user to navigate through the planets with next and previous buttons. we use a for loop and if else to iterate through the planets list and display the current planet's image based on the currentPlanetIndex. The user can navigate through the planets using the navigation buttons.![Screenshot2023-09-03 ](https://github.com/BEAST-PRINCE/CSOC_Hackathon/assets/138673188/e073eba3-1a03-4176-a5ea-9445196abe91)
![Screenshot 2023-09-03 ](https://github.com/BEAST-PRINCE/CSOC_Hackathon/assets/138673188/b12b54bf-34ca-47c0-8a19-cc6212ca1492)
