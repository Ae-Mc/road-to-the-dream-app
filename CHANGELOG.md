## 0.1.0 (2022-03-15)

### Feat

- **tasks/TaskDetailsPage**: add date range string caption
- **theme**: set strokeWidth to 2, use getters for strokeWidth and fontFamily to support hot reload
- **tasks**: add TaskDetailsPage
- **tasks/utils**: add dateRangeToText util function
- **tasks**: use strokeWidth from theme instead of hardcoded values
- **theme**: add caption text style and global stroke width config
- **tasks/CreateCategoryDialog**: add category creation bloc logic
- **tasks/CreateTaskDialog**: add task creation bloc logic
- **tasks/widgets**: add delete logic to category and task cards
- **tasks/bloc**: write event handler function and implement most of Tasks logic
- **tasks/data**: add replaceTask method implementation and rewrite other methods in functional style
- **tasks/bloc**: add events to TasksEvent
- **tasks/data**: create TasksRepository abstract class implementaion - TasksRepositoryImpl
- **tasks/data**: create TasksLocalDatasource abstract class implementation - TasksLocalDatasourceImpl
- **tasks/data**: create TasksLocalDatasource abstract class
- **tasks/domain**: create TasksRepository abstract class
- **tasks/UniversalCard**: add auto dialog close on popup menu's button tap in UniversalCard
- **tasks/CreateCategoryDialog**: rework CreateCategoryDialog, add error handling
- **tasks/utils**: create DateEditingController - TextEditingController with additional date getter
- **tasks/entities**: add hashCode getter, operator == and copyWith method to UUID class
- **splash**: add SharedPreferences initialization
- **tasks/entities**: add toJson/fromJson to entities
- **splash**: update splash screen ui to follow design
- **core/widgets**: create StyledIcon widget and use it in StyledIconButton widget
- **tasks/CreateTaskDialog**: complete CreateTaskDialog ui
- **tasks/CreateTaskDialog**: add CreateStageWidget
- **tasks/widgets**: create DateTextField widget
- **tasks/CreateTaskDialog**: complete CreateTaskWidget
- **tasks/widgets**: add keyboardType and maxLines properties to StyledTextField
- **tasks**: create DateInputRow widget
- **tasks**: add stages field to Task entity
- **tasks**: add Stage entity
- **tasks**: add toString method to UUID class
- **theme**: add disabled and error colors to color theme and use them
- **tasks**: start writing create task dialog
- **theme**: add body1Bold text style
- **tasks**: create InputFieldPrefixIcon widget
- **tasks**: add maxLines property to StrokeText widget and use it in UniversalCard

### Fix

- **tasks/widgets**: fix strokeWidth in UniversalCard's subtitle StrokeText widget
- **tasks/CategoryDetailsPage**: remove TasksState direct usage
- **tasks/widgets**: fix StrokeWidth stroke style
- **tasks/CategoryDetailsPage**: fix UI not updating on category update
- **tasks**: fix Input_row.dart import name to input_row.dart
- **theme**: fix body1Regular's font size
- **theme**: fix card theme's color and elevated button theme's padding and border radius

### Refactor

- **tasks**: rename Task's "start" to "from" and Task's "end" to "to" and use dateRangeToText util in Stage and Task extension methods
- use shortcut variables to access theme
- **tasks/CreateTaskDialog**: replace DateInputRow with InputRow with DateEditingController. Remove obsolete classes
- **app**: move TasksBloc provider to root page
- **tasks**: create separate InputRow and SeparatorRow TableRow ancestors and create CreateTaskWidget widget
- **tasks**: rename InputFieldPrefixIcon to TextFieldPrefixIcon

## 0.0.1 (2022-03-10)

### Feat

- **tasks**: create category details page
- **tasks**: add TaskCard widget
- **tasks**: add SwitcherLine widget
- **tasks**: add UniversalCard widget
- **tasks**: add id field to task and category models
- **tasks**: write json serializable uuid wrapper
- **tasks**: add route to new search category page on categories page
- **tasks**: add category search page
- **theme**: add fontWeight to body1Regular text style
- **tasks**: complete create category dialog ui
- **tasks**: create StyledIconButton widget
- **tasks**: add StyledTextField widget
- **theme**: add shadow color
- **tasks**: start writing create category dialog
- **router**: remove counter feature and update router to use new pages
- **core**: write root page (parent of all pages) to add Scaffold and SafeArea by default
- **tasks**: write categories page base implementation
- **tasks**: add widget for showing text with stroke
- **app**: provide TasksBloc to all routes
- **tasks**: add bloc skeleton
- **tasks**: write base entities: Task and Category
- **splash**: add intl initialization to startup repository
- **app**: use created theme models in App
- **theme**: use colors and text styles from design in theme models
- **splash**: remove example loading module initialization
- rename app according to instruction from README

### Refactor

- **tasks**: move range string computation to separate extension to Task entity
- **tasks**: rework CategoryCard widget with UniversalCard

### Fix

- **tasks**: fix date format in task preview row widget
- **theme**: fix elevated button theme's shape
- **app**: fix app title
