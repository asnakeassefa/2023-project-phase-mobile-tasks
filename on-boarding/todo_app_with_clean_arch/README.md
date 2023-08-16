# My Todo flutter project
It is a regular todo app that helps you to manage your tasks,
create, edit, list, are some functionalities you can get in this app.

## Installations
you can install it only in android and ios phones.

## usage
create task: when you click the create task button you navigate to create task page and you there are text fields fill all text fields and you can press 'Add Task' button the it will directly lead you to list page and display you task there.

show Detail: press the task and it will show you the detail

edit task: after getting to the details page there vertical 3 dots in the app bar and when you click that it will lead you to the edits page.

## Architecture
This project follows the Clean Architecture principles:

### Domain layer
This layer is the inner most layer and abstract different implementation there.
it does have usecase and entity there.
it handles the buisness logic of the app.
 
### Data layer
The data layer handles the data retrival and storage

### presentaion layer
The presentation layer hadles the user interface and user interactions