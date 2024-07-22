# tech_jar

Strucutre of Applicaiton
- ![Structure](structure-1.jpg)
Above image shows the Structure of our application. Here we have created 5 Folders.
    1. config
    2. model
    3. provider
    4. view
    5. widgets

    1.config
        In this folder, we have currently 5 files. These files are related to routes, api service, and list of providers.
        All the route setups are done in app_routes, route_arguments and route_generator files.
        In app_routes we have defined static route name that is use in route_generator files, in route_arguments file we have defined arguments that are neede to navigate from one screen to another. There we have different class for different screen. And lastly route_generator we have used switch case to compare route and navigate to related screen. In this file we do have defined error screen if selected route is not available.
        All the methods to fetch API is defined here. Method to getPost, getPostDetails, getPostDetailsComment and to PostComment in postDetail is defined here. We have used DIO package to get data from api.
        At last we have defined all the provider we have created throughout our application here. This provider list is used in main file on Multiprovider.
    
    2. model
        This folder contains of class of data models. Currently we have 2 files, post_comment and post. Post file have datatype for post which is generate by JsonSerializable to convert to or from json. Similarly, same goes to post_comment file. This file is inheriated to post file, as we need both fields for our application.
    
    3. provider
        In this folder we have created provider class to get data from APIService file. All these file are used in used in provider file and in view folders related ui file.
    
    4. view
        This folder we have defined all the UI related files. We currently have 2 files, 1 for home_screen and other for detail_screen. Home_screen is for main screen and other one is for detail_screen.
        We have used provider to consume api data. Using consumer we can easily populate our screen throught API data.

    5. widgets
        This folder consist of widgets that can be used multiple times in our application. we currently have 3 file here, which are empty_widget, loading_widget and post_widget. 
