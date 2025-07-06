أداة Dart CLI لتوليد ملفات Flutter بنمط MVVM بسهولة، تشمل:

✅ ملفات View و Widget
✅ ملفات Cubit و State و Model
✅ دعم Repository و DataSource
✅ توليد ملفات API (Dio, Endpoints, Manager)

🚀 التثبيت

لتثبيت الأداة بشكل عالمي:
dart pub global activate mvvm_generator

📌 ملاحظة مهمة:

لو ظهرت لك رسالة مثل:

Pub installs executables into C:\Users\USERNAME\AppData\Local\Pub\Cache\bin, which is not on your path.

↪️ أضف هذا المسار إلى PATH يدويًا:

Windows:
C:\Users\USERNAME\AppData\Local\Pub\Cache\bin

export PATH="$PATH":"$HOME/.pub-cache/bin"
⚙️ الأوامر المتاحة
1️⃣ mvvm_page
⟶ لتوليد صفحة MVVM عادية (View + Widget + Cubit + State + Model):
mvvm_page home_page

lib/feature/home_page/
├── presentation/
│   ├── view/home_page_view.dart
│   └── widget/home_page_widget.dart
├── data/
│   ├── cubit/home_page_cubit.dart
│   ├── cubit/home_page_state.dart
│   └── model/home_page_model.dart



2️⃣ mvvm_page_repo
⟶ لتوليد صفحة كاملة مع Repository و DataSource:
mvvm_page_repo students_page

lib/feature/students_page/
├── presentation/
│   ├── view/students_page_view.dart
│   └── widget/students_page_widget.dart
├── data/
│   ├── cubit/students_page_cubit.dart
│   ├── cubit/students_page_state.dart
│   ├── model/students_page_model.dart
│   ├── repository/students_page_repository.dart
│   └── datasource/students_page_datasource.dart


3️⃣ mvvm_core_api
⟶ لتوليد ملفات API الأساسية:

mvvm_core_api



lib/core/api/
├── api_constant.dart
├── api_endpoint.dart
├── api_manager.dart


⚠️ تأكد من إضافة مكتبة Dio إلى مشروعك:
dart pub add dio

🧪 مثال استخدام سريع
mvvm_page_repo profile


📄 الترخيص
MIT License © 2025 Mohamed Zebib


