
import 'package:getx_dependencies_binding_annotation/getx_dependencies_binding_annotation.dart';

abstract class LocalDataSourceRepository {
  loadData();
  saveData();
}

@GetPut.repository(as: 'LocalDataSourceRepository')
class LocalDataSourceRepositoryImpl implements LocalDataSourceRepository {

  @override
  loadData() {}

  @override
  saveData() {}
}
