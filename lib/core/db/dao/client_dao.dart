import 'package:floor/floor.dart';
import 'package:mobile/core/models/client.dart';

@dao
abstract class ClientDao {
  @Query('SELECT * FROM Client')
  Future<List<Client>> findAllClients();

  @Query('SELECT * FROM Client WHERE id = :id')
  Stream<Client> findClientById(int id);

  @insert
  Future<void> insertClient(Client client);

  @insert
  Future<List<int>> insertClients(List<Client> clients);

  @delete
  Future<int> deleteClients(List<Client> clients);

  @Query('DELETE FROM Client')
  Future<void> deleteAllClients();
}
