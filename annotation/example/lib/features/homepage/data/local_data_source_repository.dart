
import 'package:getx_binding_annotation/annotation.dart';

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
