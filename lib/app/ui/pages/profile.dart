import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import '../../config/config.dart';
import '../../controller/profile.dart';
import '../themes/colors.dart';
import '../widgets/common_text.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ProfileController.to.scrollController.addListener(() {
      setState(() {});
    });
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: ProfileController.to.scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraint) {
                    ProfileController.to.top = constraint.biggest.height;
                    return Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.grey,
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              opacity:
                                  ProfileController.to.top <= 200.0 ? 1.0 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: Row(
                                children: [
                                  const SizedBox(width: 12),
                                  Container(
                                    height: kToolbarHeight / 1.8,
                                    width: kToolbarHeight / 1.8,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConfig.noImage)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.grey,
                                              blurRadius: 1.0),
                                        ]),
                                  ),
                                  const SizedBox(width: 12),
                                  const CommonText(text: "Guest")
                                ],
                              ),
                            ),
                          ],
                        ),
                        background: const Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(AppConfig.noImage),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [buildColumn(context)],
                ),
              )
            ],
          ),
          buildCameraButton()
        ],
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: CommonText(text: "User Info"),
        ),
        const Divider(
          thickness: 1,
          color: AppColors.grey,
        ),
        buildMaterial(
            context: context,
            title: "Email",
            subTitle: "sukucse717@gmail.com",
            onPressed: () {},
            icon: Icons.email),
        buildMaterial(
            context: context,
            title: "Email",
            subTitle: "sukucse717@gmail.com",
            onPressed: () {},
            icon: Icons.email),
        buildMaterial(
            context: context,
            title: "Email",
            subTitle: "sukucse717@gmail.com",
            onPressed: () {},
            icon: Icons.email),
        buildMaterial(
            context: context,
            title: "Email",
            subTitle: "sukucse717@gmail.com",
            onPressed: () {},
            icon: Icons.email),
        buildMaterial(
            context: context,
            title: "Email",
            subTitle: "sukucse717@gmail.com",
            onPressed: () {},
            icon: Icons.email),
        buildMaterial(
            context: context,
            title: "Email",
            subTitle: "sukucse717@gmail.com",
            onPressed: () {},
            icon: Icons.email),
        buildMaterial(
            context: context,
            title: "Email",
            subTitle: "sukucse717@gmail.com",
            onPressed: () {},
            icon: Icons.email),
        buildMaterial(
            context: context,
            title: "Email",
            subTitle: "sukucse717@gmail.com",
            onPressed: () {},
            icon: Icons.email),
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: CommonText(text: "User Settings"),
        ),
        const Divider(
          thickness: 1,
          color: AppColors.grey,
        ),
        Obx(() => ListTileSwitch(
              value: ProfileController.to.isDarkTheme,
              leading: const Icon(Icons.dark_mode),
              onChanged: (value) {
                ProfileController.to.isDarkTheme = value;
              },
              visualDensity: VisualDensity.comfortable,
              switchType: SwitchType.cupertino,
              switchActiveColor: AppColors.primary,
              title: const CommonText(text: 'Dark Theme'),
            )),
        buildMaterial(
            context: context,
            title: "Logout",
            subTitle: "",
            onPressed: () {},
            icon: Icons.exit_to_app_rounded),
      ],
    );
  }

  Material buildMaterial(
      {required context,
      required title,
      required subTitle,
      required onPressed,
      required icon}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: onPressed,
          title: CommonText(
            text: title,
          ),
          subtitle: CommonText(text: subTitle),
          leading: Icon(icon),
        ),
      ),
    );
  }

  Widget buildCameraButton() {
    const double defaultMargin = 200.0 - 4.0;
    const double scaleStart = 160.0;
    const double scaleEnd = scaleStart / 2;
    double top = defaultMargin;
    double scale = 1.0;
    if (ProfileController.to.scrollController.hasClients) {
      double offset = ProfileController.to.scrollController.offset;
      top -= offset;
      if (offset < defaultMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultMargin - scaleEnd) {
        scale = (defaultMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }
    return Positioned(
        top: ProfileController.to.top,
        right: 16.0,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: FloatingActionButton(
            heroTag: "jhkj",
            onPressed: () {},
            child: const Icon(Icons.camera_alt),
          ),
        ));
  }
}
