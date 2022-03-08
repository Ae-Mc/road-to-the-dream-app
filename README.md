# Шаблон Flutter-приложения

Как пользоваться:

1. Скопировать этот репозиторий (`git clone https://github.com/Ae-Mc/flutter-template-project`)
2. Переименовать все вхождения `flutter_template_project` на предпочитаемое имя проекта (например, `my_cool_app`). Это можно осуществить с помощью инструмента поиска и замены в проекте из Visual Studio Code.
3. Выполнить команды
   ```bash
   flutter pub get
   flutter pub run rename -a <Имя приложения>
   flutter pub run rename -b <Application ID>
   flutter pub run build_runner build
   ```
   Application ID — уникальный идентификатор приложения для публикации в Google Play и App Store.
4. Перезапустить IDE
