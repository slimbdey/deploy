import 'package:hw/data/datasources/i_datasource.dart';
import 'package:hw/data/datasources/i_localstorage.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/mappers/measure_unit_mapper.dart';
import 'package:hw/data/repositories/network_checker.dart';
import 'package:hw/data/repositories/sync/measure_unit_repository_sync.dart';
import 'package:hw/domain/entities/measure_unit.dart';
import 'package:hw/domain/interfaces/i_measure_unit_repository.dart';

class MeasureUnitRepository extends NetworkChecker
    implements IMeasureUnitRepository {
  final IDatasource ds;
  final ILocalStorage ls;

  MeasureUnitRepository({required this.ds, required this.ls});

  List<MeasureUnit> _mapList(List<MeasureUnitDto> dtos) =>
      dtos.map(MeasureUnitMapper.mapDtoToEntity).toList();

  @override
  Future<List<MeasureUnit>> getList() async {
    await syncBackground();
    final dtos = await getMeasureUnits();
    return _mapList(dtos);
  }
}
