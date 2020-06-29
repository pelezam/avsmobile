import 'package:floor/floor.dart';
import 'package:mobile/core/models/collecte.dart';

@dao
abstract class CollectDao {
  @Query('SELECT * FROM Collecte')
  Future<List<Collecte>> findAllCollects();

  @Query('SELECT * FROM Collecte WHERE id = :id')
  Stream<Collecte> findCollectById(int id);

  @insert
  Future<int> insertCollect(Collecte collect);

  @insert
  Future<List<int>> insertCollects(List<Collecte> collects);

  @Query('DELETE FROM Collecte')
  Future<void> deleteAllCollects();
}
