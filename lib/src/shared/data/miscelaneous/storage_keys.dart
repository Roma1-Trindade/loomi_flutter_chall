enum StorageKey {
  userEmail(keyName: 'user_email'),
  userName(keyName: 'user_name'),
  ;

  const StorageKey({required this.keyName});

  final String keyName;
}
