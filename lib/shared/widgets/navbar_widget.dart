import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok_clon_app/shared/constants/colors.dart';
import 'package:tiktok_clon_app/shared/constants/icons_svg.dart';

class NavbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      height: widget.preferredSize.height,
      width: widget.preferredSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int index = 0; index < iconList.length; index++)
            InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index; // Actualiza el índice del ícono seleccionado
                });
              },
              child: index == 2 // Si es el ítem 3, agregue espacios adicionales a cada lado
                  ? Container(
                      alignment: Alignment.center,
                      width: size.width * 0.2,
                      child: IconNavbarWidget(
                        name: iconList[index]['name'],
                        iconAssets: iconList[index]['icon'] ?? "",
                        isSelected:
                            index == selectedIndex, // Verifica si el ícono está seleccionado
                      ),
                    )
                  : SizedBox(
                      width: size.width * 0.2,
                      child: IconNavbarWidget(
                        name: iconList[index]['name'],
                        iconAssets: iconList[index]['icon'] ?? "",
                        isSelected:
                            index == selectedIndex, // Verifica si el ícono está seleccionado
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}

class IconNavbarWidget extends StatelessWidget {
  const IconNavbarWidget(
      {super.key, this.name = "", required this.iconAssets, required this.isSelected});

  final String? name;
  final String iconAssets;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    // color: name == "" ? Colors.white : Colors.transparent,
                    gradient: name == ""
                        ? const LinearGradient(
                            colors: [
                              AppColors.blue,
                              AppColors.pink,
                            ],
                          )
                        : null,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: name == "" ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: name == ""
                        ? const EdgeInsets.symmetric(horizontal: 12, vertical: 7)
                        : EdgeInsets.zero,
                    child: SvgPicture.asset(
                      iconAssets,
                      semanticsLabel: name,
                      colorFilter: ColorFilter.mode(
                        isSelected && name != ""
                            ? Colors.white
                            : (name == "" ? Colors.black : Colors.grey),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          name!.isNotEmpty ? name! : "",
          // style: TextStyle(
          //   color: isSelected ? Colors.white : Colors.grey,
          //   fontSize: name == 'Bandeja de entrada' ? 10 : 12,
          // ),
          style: isSelected
              ? textTheme.displaySmall
              : textTheme.displaySmall!.copyWith(
                  color: Colors.grey,
                ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
