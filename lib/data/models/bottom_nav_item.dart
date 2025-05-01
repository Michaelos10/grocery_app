class NavItem {
  final String label;
  final dynamic onIcon; // String path or IconData
  final dynamic offIcon; // String path or IconData
  final bool isIcon;

  NavItem(this.label, this.onIcon, this.offIcon, {required this.isIcon});
}
