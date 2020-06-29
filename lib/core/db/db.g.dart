// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DbBuilder databaseBuilder(String name) => _$DbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DbBuilder inMemoryDatabaseBuilder() => _$DbBuilder(null);
}

class _$DbBuilder {
  _$DbBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$DbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<Db> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$Db();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$Db extends Db {
  _$Db([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ClientDao _clientDaoInstance;

  AgentDao _agentDaoInstance;

  ProductDao _productDaoInstance;

  CollectDao _collectDaoInstance;

  UserDao _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Client` (`id` INTEGER, `numero` TEXT, `photo` TEXT, `date_naissance` TEXT, `profession` TEXT, `nationalite` TEXT, `nom_conjoint` TEXT, `cni` TEXT, `beneficiaire` TEXT, `procurateur` TEXT, `personne_reference` TEXT, `lieu_travail` TEXT, `contact` TEXT, `adresse` TEXT, `created_at` TEXT, `updated_at` TEXT, `mise` INTEGER, `agent` INTEGER, `suivi_par` INTEGER, `zone` INTEGER, `user` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Agent` (`id` INTEGER, `last_name` TEXT, `first_name` TEXT, `username` TEXT, `email` TEXT, `adresse` TEXT, `telephone` TEXT, `type_agent` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Images` (`id` INTEGER, `image` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Product` (`id` INTEGER, `libelle` TEXT, `categorie` TEXT, `prix` INTEGER, `created_at` TEXT, `status` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Collecte` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `client` INTEGER, `agent` INTEGER, `somme` INTEGER, `depot` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER, `last_login` TEXT, `is_superuser` INTEGER, `username` TEXT, `first_name` TEXT, `last_name` TEXT, `email` TEXT, `is_staff` INTEGER, `is_active` INTEGER, `date_joined` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  ClientDao get clientDao {
    return _clientDaoInstance ??= _$ClientDao(database, changeListener);
  }

  @override
  AgentDao get agentDao {
    return _agentDaoInstance ??= _$AgentDao(database, changeListener);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }

  @override
  CollectDao get collectDao {
    return _collectDaoInstance ??= _$CollectDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$ClientDao extends ClientDao {
  _$ClientDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _clientInsertionAdapter = InsertionAdapter(
            database,
            'Client',
            (Client item) => <String, dynamic>{
                  'id': item.id,
                  'numero': item.numero,
                  'photo': item.photo,
                  'date_naissance': item.date_naissance,
                  'profession': item.profession,
                  'nationalite': item.nationalite,
                  'nom_conjoint': item.nom_conjoint,
                  'cni': item.cni,
                  'beneficiaire': item.beneficiaire,
                  'procurateur': item.procurateur,
                  'personne_reference': item.personne_reference,
                  'lieu_travail': item.lieu_travail,
                  'contact': item.contact,
                  'adresse': item.adresse,
                  'created_at': item.created_at,
                  'updated_at': item.updated_at,
                  'mise': item.mise,
                  'agent': item.agent,
                  'suivi_par': item.suivi_par,
                  'zone': item.zone,
                  'user': item.user
                },
            changeListener),
        _clientDeletionAdapter = DeletionAdapter(
            database,
            'Client',
            ['id'],
            (Client item) => <String, dynamic>{
                  'id': item.id,
                  'numero': item.numero,
                  'photo': item.photo,
                  'date_naissance': item.date_naissance,
                  'profession': item.profession,
                  'nationalite': item.nationalite,
                  'nom_conjoint': item.nom_conjoint,
                  'cni': item.cni,
                  'beneficiaire': item.beneficiaire,
                  'procurateur': item.procurateur,
                  'personne_reference': item.personne_reference,
                  'lieu_travail': item.lieu_travail,
                  'contact': item.contact,
                  'adresse': item.adresse,
                  'created_at': item.created_at,
                  'updated_at': item.updated_at,
                  'mise': item.mise,
                  'agent': item.agent,
                  'suivi_par': item.suivi_par,
                  'zone': item.zone,
                  'user': item.user
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _clientMapper = (Map<String, dynamic> row) => Client(
      row['id'] as int,
      row['numero'] as String,
      row['photo'] as String,
      row['date_naissance'] as String,
      row['profession'] as String,
      row['nationalite'] as String,
      row['nom_conjoint'] as String,
      row['cni'] as String,
      row['beneficiaire'] as String,
      row['procurateur'] as String,
      row['personne_reference'] as String,
      row['lieu_travail'] as String,
      row['contact'] as String,
      row['adresse'] as String,
      row['created_at'] as String,
      row['updated_at'] as String,
      row['mise'] as int,
      row['agent'] as int,
      row['suivi_par'] as int,
      row['zone'] as int,
      row['user'] as int);

  final InsertionAdapter<Client> _clientInsertionAdapter;

  final DeletionAdapter<Client> _clientDeletionAdapter;

  @override
  Future<List<Client>> findAllClients() async {
    return _queryAdapter.queryList('SELECT * FROM Client',
        mapper: _clientMapper);
  }

  @override
  Stream<Client> findClientById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Client WHERE id = ?',
        arguments: <dynamic>[id], tableName: 'Client', mapper: _clientMapper);
  }

  @override
  Future<void> deleteAllClients() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Client');
  }

  @override
  Future<void> insertClient(Client client) async {
    await _clientInsertionAdapter.insert(
        client, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<List<int>> insertClients(List<Client> clients) {
    return _clientInsertionAdapter.insertListAndReturnIds(
        clients, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deleteClients(List<Client> clients) {
    return _clientDeletionAdapter.deleteListAndReturnChangedRows(clients);
  }
}

class _$AgentDao extends AgentDao {
  _$AgentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _agentInsertionAdapter = InsertionAdapter(
            database,
            'Agent',
            (Agent item) => <String, dynamic>{
                  'id': item.id,
                  'last_name': item.last_name,
                  'first_name': item.first_name,
                  'username': item.username,
                  'email': item.email,
                  'adresse': item.adresse,
                  'telephone': item.telephone,
                  'type_agent': item.type_agent
                }),
        _agentDeletionAdapter = DeletionAdapter(
            database,
            'Agent',
            ['id'],
            (Agent item) => <String, dynamic>{
                  'id': item.id,
                  'last_name': item.last_name,
                  'first_name': item.first_name,
                  'username': item.username,
                  'email': item.email,
                  'adresse': item.adresse,
                  'telephone': item.telephone,
                  'type_agent': item.type_agent
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _agentMapper = (Map<String, dynamic> row) => Agent(
      row['id'] as int,
      row['last_name'] as String,
      row['first_name'] as String,
      row['username'] as String,
      row['email'] as String,
      row['adresse'] as String,
      row['telephone'] as String,
      row['type_agent'] as String);

  final InsertionAdapter<Agent> _agentInsertionAdapter;

  final DeletionAdapter<Agent> _agentDeletionAdapter;

  @override
  Future<List<Agent>> findAllAgents() async {
    return _queryAdapter.queryList('SELECT * FROM Agent', mapper: _agentMapper);
  }

  @override
  Future<void> deleteAllAgents() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Agent');
  }

  @override
  Future<void> insertAgent(Agent agent) async {
    await _agentInsertionAdapter.insert(agent, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<List<int>> insertAgents(List<Agent> agents) {
    return _agentInsertionAdapter.insertListAndReturnIds(
        agents, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deleteAgents(List<Agent> agents) {
    return _agentDeletionAdapter.deleteListAndReturnChangedRows(agents);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _productInsertionAdapter = InsertionAdapter(
            database,
            'Product',
            (Product item) => <String, dynamic>{
                  'id': item.id,
                  'libelle': item.libelle,
                  'categorie': item.categorie,
                  'prix': item.prix,
                  'created_at': item.created_at,
                  'status': item.status
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _productMapper = (Map<String, dynamic> row) => Product(
      row['id'] as int,
      row['libelle'] as String,
      row['categorie'] as String,
      row['prix'] as int,
      row['created_at'] as String,
      row['status'] as String);

  final InsertionAdapter<Product> _productInsertionAdapter;

  @override
  Future<List<Product>> findAllProduct() async {
    return _queryAdapter.queryList('SELECT * FROM Product',
        mapper: _productMapper);
  }

  @override
  Future<void> deleteAllProducts() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Product');
  }

  @override
  Future<List<int>> insertProducts(List<Product> products) {
    return _productInsertionAdapter.insertListAndReturnIds(
        products, sqflite.ConflictAlgorithm.abort);
  }
}

class _$CollectDao extends CollectDao {
  _$CollectDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _collecteInsertionAdapter = InsertionAdapter(
            database,
            'Collecte',
            (Collecte item) => <String, dynamic>{
                  'id': item.id,
                  'client': item.client,
                  'agent': item.agent,
                  'somme': item.somme,
                  'depot': item.depot
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _collecteMapper = (Map<String, dynamic> row) => Collecte(
      row['id'] as int,
      row['client'] as int,
      row['agent'] as int,
      row['somme'] as int,
      row['depot'] as int);

  final InsertionAdapter<Collecte> _collecteInsertionAdapter;

  @override
  Future<List<Collecte>> findAllCollects() async {
    return _queryAdapter.queryList('SELECT * FROM Collecte',
        mapper: _collecteMapper);
  }

  @override
  Stream<Collecte> findCollectById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Collecte WHERE id = ?',
        arguments: <dynamic>[id],
        tableName: 'Collecte',
        mapper: _collecteMapper);
  }

  @override
  Future<void> deleteAllCollects() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Collecte');
  }

  @override
  Future<int> insertCollect(Collecte collect) {
    return _collecteInsertionAdapter.insertAndReturnId(
        collect, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<List<int>> insertCollects(List<Collecte> collects) {
    return _collecteInsertionAdapter.insertListAndReturnIds(
        collects, sqflite.ConflictAlgorithm.abort);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'last_login': item.last_login,
                  'is_superuser': item.is_superuser ? 1 : 0,
                  'username': item.username,
                  'first_name': item.first_name,
                  'last_name': item.last_name,
                  'email': item.email,
                  'is_staff': item.is_staff ? 1 : 0,
                  'is_active': item.is_active ? 1 : 0,
                  'date_joined': item.date_joined
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'last_login': item.last_login,
                  'is_superuser': item.is_superuser ? 1 : 0,
                  'username': item.username,
                  'first_name': item.first_name,
                  'last_name': item.last_name,
                  'email': item.email,
                  'is_staff': item.is_staff ? 1 : 0,
                  'is_active': item.is_active ? 1 : 0,
                  'date_joined': item.date_joined
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _userMapper = (Map<String, dynamic> row) => User(
      row['id'] as int,
      row['last_login'] as String,
      (row['is_superuser'] as int) != 0,
      row['username'] as String,
      row['first_name'] as String,
      row['last_name'] as String,
      row['email'] as String,
      (row['is_staff'] as int) != 0,
      (row['is_active'] as int) != 0,
      row['date_joined'] as String);

  final InsertionAdapter<User> _userInsertionAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM User', mapper: _userMapper);
  }

  @override
  Future<User> findUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM User WHERE id = ?',
        arguments: <dynamic>[id], mapper: _userMapper);
  }

  @override
  Future<void> deleteAllUsers() async {
    await _queryAdapter.queryNoReturn('DELETE FROM User');
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<List<int>> insertUsers(List<User> users) {
    return _userInsertionAdapter.insertListAndReturnIds(
        users, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deleteUsers(List<User> users) {
    return _userDeletionAdapter.deleteListAndReturnChangedRows(users);
  }
}
