## v0.0.1 (2022-03-10)

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
