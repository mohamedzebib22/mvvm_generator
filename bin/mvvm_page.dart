import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('❌ Please enter a command like:');
    print('   mvvm_generator clients_page');
    print('Or to generate files API:');
    print('   mvvm_generator_api');
    return;
  }

  final rawName = arguments.first;
  final pageName = _toSnakeCase(rawName); // clients_page
  final className = _toPascalCase(rawName); // ClientsPage

  createMVVMStructure(pageName, className);
}

void createMVVMStructure(String pageName, String className) {
  final basePath = 'lib/feature/$pageName';

  final structure = {
    '$basePath/presentation/view': '${pageName}_view.dart',
    '$basePath/presentation/widget': '${pageName}_widget.dart',
    '$basePath/data/model': '${pageName}_model.dart',
    '$basePath/data/cubit': [
      '${pageName}_cubit.dart',
      '${pageName}_state.dart'
    ],
  };

  structure.forEach((path, files) {
    Directory(path).createSync(recursive: true);
    if (files is String) {
      File('$path/$files').writeAsStringSync(_getTemplate(files, className));
    } else if (files is List<String>) {
      for (final file in files) {
        File('$path/$file')
            .writeAsStringSync(_getTemplate(file, className));
      }
    }
  });

  print('✅ Page created"$pageName" Use MVVM Success!');
}

String _getTemplate(String fileName, String className) {
  if (fileName.endsWith('_view.dart')) {
    return '''
import 'package:flutter/material.dart';

class ${className}View extends StatelessWidget {
  const ${className}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$className')),
      body: const Center(child: Text('Welcome to $className View')),
    );
  }
}
''';
  } else if (fileName.endsWith('_widget.dart')) {
    return '''
import 'package:flutter/material.dart';

class ${className}Widget extends StatelessWidget {
  const ${className}Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); // TODO: build your widget
  }
}
''';
  } else if (fileName.endsWith('_model.dart')) {
    return '''
class ${className}Model {
  // TODO: Define model fields
}
''';
  } else if (fileName.endsWith('_cubit.dart')) {
    return '''
import 'package:flutter_bloc/flutter_bloc.dart';
part '${_getStateFile(fileName)}';

class ${className}Cubit extends Cubit<${className}State> {
  ${className}Cubit() : super(${className}Initial());

  // TODO: Add logic here
}
''';
  } else if (fileName.endsWith('_state.dart')) {
    return '''
part of '${_getCubitFile(fileName)}';

abstract class ${className}State {}

class ${className}Initial extends ${className}State {}
''';
  } else {
    return '// TODO: $fileName';
  }
}

String _getStateFile(String cubitFile) {
  return cubitFile.replaceFirst('_cubit.dart', '_state.dart');
}

String _getCubitFile(String stateFile) {
  return stateFile.replaceFirst('_state.dart', '_cubit.dart');
}

String _toSnakeCase(String input) {
  return input.replaceAllMapped(
      RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}').replaceFirst('_', '');
}

String _toPascalCase(String input) {
  return input
      .split(RegExp(r'[_\s]'))
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join();
}
