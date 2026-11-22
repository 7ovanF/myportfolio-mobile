# myportfolio_mobile

Nama: Jovan Finesta

NPM: 2506599144

Kelas: PBP B

## Tugas 7

#### Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.
A widget tree is a hierarchical structure that describes how each component in the page is organized. Each widget can have one or several children depending on its type and defines the rendering of its children. For example, the `Center` widget that centers its child.

#### List all the widgets you used in this project and explain each of their functions.
Too many.

Custom widgets
- `MyApp`: initializes the `MaterialApp` with specific configurations.
- `MyHomePage`: builds the whole layout of the main page out of `Scaffold`s, `InfoCard`s, etc.
- `InfoCard`: builds a single `Card` element with `Text` children with content as specified when constructed.
- `ItemCard`: builds a button with configurable icon, display text, color...

Built-in widgets
- `MaterialApp`: see below
- `Scaffold`: provides a full structure scaffold for Material pages, having predefined slots for `AppBar`, `body`, `FloatingActionButton`...
- `AppBar`: app bar of a Material page, positioned on top typically.
- `Text`: simple configurable text.
- `Row`/`Column`: Flex layout widgets.
- `Center`: Align center, both horizontally and vertically.

#### What is the purpose of the MaterialApp widget? Explain why this widget is commonly used as the root widget in Flutter applications.
The `MaterialApp` widget is a wrapper around `WidgetsApp`, which initializes the minimal set of widgets and functionality that an app commonly uses (such as binding the back button); `MaterialApp` adds behaviors specific to Google's Material design.

Extending the capability of `WidgetsApp`, it is responsible for:
- Routing/Navigation: creates and configures a `Navigator` to search for routes in a specific order (first, for the `/` route, the `home` property is used. Then, its `routes` property. Etc.)
- Themes: globally sets themes (color schemes, typography...) via the `theme` property (the reason `Theme.of(context)` works)
- Localization: via `supportedLocales`, `localizationDelegates`, etc. properties

Providing functionality that would otherwise have to be implemented by the developer, using it as the root widget simplifies development.

#### Explain the difference between StatelessWidget and StatefulWidget. When should you choose StatelessWidget, and when is StatefulWidget necessary?
A `StatelessWidget` does not manage a changing internal state; at most, it has properties customizable via the constructor called by another (usually parent) widget, but it does not mutate by itself. A `StatefulWidget` is the opposite. 

For example, a reusable, simple component like a button widget, which may have different symbols and text but only when declared through its constructor, is a `StatelessWidget`, while the placeholder menu of a new Flutter project is a `StatefulWidget` (button presses mutate a counter).

A `StatelessWidget` should be used if a component does *not* mutate on its own. Otherwise, use a `StatefulWidget`.

#### What is BuildContext and why is it crucial in Flutter? How is it used inside the build method?
`BuildContext` represents the context for the widget about its location and status in the Flutter widget tree. It lets the Widget do things like using `Theme.of(context).colorscheme.secondary`, which it can derive because the theme was set in its ancestor, the `MaterialApp` widget.

#### Explain the concept of hot reload in Flutter and how it differs from hot restart. When can you not rely on hot reload and must instead perform a hot restart or full restart?
In a hot reload, only updated source code is recompiled, and only affected widgets are rebuilt. The state of the app and everything else are also unaffected. A hot restart recompiles the Flutter app and rebuilds the widget tree, therefore losing state. A full restart recompiles the entire Flutter App *and* underlying library code as if you just started a Dart VM fresh.

A hot restart may be needed when the developer wants to intentionally reset the state, for example observing the transition between the initial state and a mutated state. When it concerns the Flutter library or platform-specific code, perform a full reload.

## Tugas 8
1.
  - `Navigator.push()`: *pushes* a page into the top of the route stack. The page previously active will still be on the stack, so pressing "back" would pop the stack and return to the previous page.
  - `Navigator.pushReplacement()`: *replaces* the page at the top of the stack (the current page).
  - `Navigator.pop()`: *pops* the page at the top of the stack, basically "back".

  Both the action card and the Drawer's navigation button uses `Navigator.push()`. Meanwhile, the Home option uses `pushReplacement()`, so it replaces the current page's position in the route stack.

2. The `Scaffold`, representing a page in Flutter's Material UI, provides a dedicated field in its constructor for page components common in Material apps, like `appBar`s and `drawer`s. Since the build process of a Scaffold is predefined, it will put the `AppBar` and `Drawer` at their expected positions.
  
  Example of theme color usage: the secondary color is used as the background color of both the "Add Experience" button in the homepage and `ItemCard`'s (`./lib/widgets/project_card.dart`) `build()` method. Technically they're in the same page...

3. The `SingleChildScrollView` widget provides scrolling functionality, since Flutter doesn't automatically provide it for overflowing elements. For forms with more fields, it is mandatory for a tolerable experience.

  If the "spacing widget" means `Padding` fields, it is to simply apply a padding so that the field doesn't appear sticked to borders or other elements.

4. The `GlobalKey` class (with the `FormState` generic) identifies an element exactly in a global scope, making it accessible by other objects. Here, it exposes the `FormState` which stores information of fields and their values.

  `validator` is an optional property of a form's `Field`. When `validate()` is eventually called on `_formKey.currentState!.validate()` (performs the `.validate()` method on the `FormState`), each field's `validator`'s value is executed. `validator` expects a function that returns a failure message `String` and returns `null` if the field is valid.
  
  An example rejected value would be a blank project title or one completely filled by whitespace (validated by `value.trim().isEmpty`). Of course, even with the ideal widget or input type, the user still has the liberty to leave the field blank or intentionally alter it to an invalid format.
