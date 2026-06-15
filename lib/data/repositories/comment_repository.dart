import 'package:hw/data/datasources/i_datasource.dart';
import 'package:hw/data/datasources/i_localstorage.dart';
import 'package:hw/data/dtos/comment_dto.dart';
import 'package:hw/data/mappers/comment_mapper.dart';
import 'package:hw/data/repositories/network_checker.dart';
import 'package:hw/data/repositories/sync/comment_repository_sync.dart';
import 'package:hw/domain/entities/comment.dart';
import 'package:hw/domain/interfaces/i_comment_repository.dart';

class CommentRepository extends NetworkChecker implements ICommentRepository {
  final IDatasource ds;
  final ILocalStorage ls;

  CommentRepository({required this.ds, required this.ls});

  List<Comment> _mapList(List<CommentDto> dtos) =>
      dtos.map(CommentMapper.mapDtoToEntity).toList();

  @override
  Future<Comment> create(Comment value) async {
    final dto = await ds.addComment(CommentMapper.mapEntityToDto(value));
    return CommentMapper.mapDtoToEntity(dto);
  }

  @override
  Future<List<Comment>> getList(int recipeId) async {
    await syncBackground();
    final dtos = await getComments(recipeId);
    return _mapList(dtos);
  }
}
