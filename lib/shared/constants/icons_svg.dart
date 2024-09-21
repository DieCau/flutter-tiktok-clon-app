class IconsSvg {
  static const String home = 'assets/svg_icons/home.svg';
  static const String account = 'assets/svg_icons/account.svg';
  static const String add = 'assets/svg_icons/add.svg';
  static const String inbox = 'assets/svg_icons/inbox.svg';
  static const String search = 'assets/svg_icons/search.svg';
  static const String live = 'assets/svg_icons/live.svg';
  static const String camera = 'assets/svg_icons/camera.svg';
  static const String favorite = 'assets/svg_icons/favorite.svg';
  static const String comments = 'assets/svg_icons/comments.svg';
  static const String save = 'assets/svg_icons/save.svg';
  static const String share = 'assets/svg_icons/share.svg';
  static const String bell = 'assets/svg_icons/bell.svg';
  static const String shareOutlined = 'assets/svg_icons/share_outline.svg';
}

// Lista de íconos con nombres y rutas
final List<Map<String, String>> iconList = [
  {'name': 'Home', 'icon': IconsSvg.home},
  {'name': 'Amigos', 'icon': IconsSvg.search},
  {'name': '', 'icon': IconsSvg.add}, // Nombre vacío para el ícono "add"
  {'name': 'Bandeja de entrada', 'icon': IconsSvg.inbox},
  {'name': 'Perfil', 'icon': IconsSvg.account},
];

final List<Map<String, String>> appbarList = [
  {'title': 'Siguiendo'},
  {'title': 'Para ti'}
];
