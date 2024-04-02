import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web/constants/app_colors.dart';
import 'package:web/locator.dart';
import 'package:web/services/navigation_service.dart';

class NavBarItem extends StatefulWidget {
  final String title;
  final String navigationPath;
  bool isHovering;
  NavBarItem(this.title, this.navigationPath, this.isHovering, {super.key});

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: mobileView(),
      tablet: tabletView(),
      desktop: desktopView(),
    );
  }

  Widget mobileView(){
    return InkWell(
      onTap: () {
        locator<NavigationService>().navigateTo(widget.navigationPath);
        Navigator.pop(context);
      },
      onHover: (value) {
        setState(() {
          value
              ? widget.isHovering = true
              : widget.isHovering = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: widget.isHovering
                  ? const Color(0xFF077bd7)
                : const Color(0xFF241424).withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: widget.isHovering,
              child: Container(
                height: 2,
                width: 20,
                color: const Color(0xFF051441),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tabletView(){
    return InkWell(
      onTap: () {
        locator<NavigationService>().navigateTo(widget.navigationPath);
      },
      onHover: (value) {
        setState(() {
          value
              ? widget.isHovering = true
              : widget.isHovering = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  color: widget.isHovering
                      ? const Color(0xFF077bd7)
                      : const Color(0xFF077bd7),
                  fontWeight: FontWeight.w600,
                  fontSize: 12
              ),
            ),
            const SizedBox(height: 5),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: widget.isHovering,
              child: Container(
                height: 2,
                width: 20,
                color: const Color(0xFF051441),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget desktopView(){
    return InkWell(
      onTap: () {
        locator<NavigationService>().navigateTo(widget.navigationPath);
      },
      onHover: (value) {
        setState(() {
          value
              ? widget.isHovering = true
              : widget.isHovering = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: widget.isHovering,
              child: Container(
                height: 2,
                width: 50,
                color: navbarItemHoverColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
