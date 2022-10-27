import 'package:cardapio/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeGridWidget extends StatelessWidget {
  const HomeGridWidget({
    Key? key,
    required this.onPress,
    required this.chefNome,
    required this.chefImagem,
    required this.favIcon,
    required this.favIconColor,
    required this.receitaImg,
    required this.receitaNome,
    required this.tipoReceita,
    required this.receitaDuracao,
  }) : super(key: key);
  final VoidCallback onPress;
  final String chefNome;
  final String chefImagem;
  final IconData favIcon;
  final Color favIconColor;
  final String receitaImg, receitaNome, tipoReceita, receitaDuracao;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kTextWhiteColor,
        ),
        margin: EdgeInsets.only(left: 1.w, right: 1.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 11.w,
                  height: 5.h,
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: kErrorBorderColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48),
                      child: Image.asset(
                        chefImagem,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  chefNome,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: kTextPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            kSizedBox2,
            Stack(
              children: [
                Container(
                  width: 100.w,
                  height: 21.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      receitaImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 21.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black87.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 9.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF61666E).withOpacity(0.8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0fffffff),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      favIcon,
                      color: favIconColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 1.w, right: 1.w, bottom: 1.h, top: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSizedBox2,
                  Text(
                    receitaNome,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                        ),
                  ),
                  kSizedBox1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tipoReceita,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        receitaDuracao,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileGridWidget extends StatelessWidget {
  const ProfileGridWidget(
      {Key? key,
      required this.onPress,
      required this.favIcon,
      required this.favIconColor,
      required this.receitaImagem,
      required this.receitaNome,
      required this.receitatipo,
      required this.receitaDuracao})
      : super(key: key);
  final VoidCallback onPress;
  final IconData favIcon;
  final Color favIconColor;
  final String receitaImagem, receitaNome, receitatipo, receitaDuracao;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(left: 1.w, right: 1.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kTextWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 100.w,
                  height: 21.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kPrimaryColor,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      receitaImagem,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 21.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black87.withOpacity(0.5),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 9.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF61666E).withOpacity(0.8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x00ffffff),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Icon(
                        favIcon,
                        color: favIconColor,
                      ),
                    ))
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 1.w, right: 1.w, top: 1.h, bottom: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receitaNome,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 11.sp,
                        ),
                  ),
                  kSizedBox1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        receitatipo,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        receitaDuracao,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
