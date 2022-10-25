import 'package:cardapio/constants.dart';
import 'package:cardapio/methods/text_capitalize.dart';
import 'package:cardapio/telas/tela_perfil/model/perfil_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetalhesReceita extends StatelessWidget {
  DetalhesReceita({this.myProfileDetailModel, this.myRecipesItemModel});

  static const String routeName = 'DetalhesReceita';

  final MyProfileDetailModel? myProfileDetailModel;
  final MyRecipesItemModel? myRecipesItemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(myRecipesItemModel!.img),
                  fit: BoxFit.cover),
            ),
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black87.withOpacity(0.5),
              ),
              child: DraggableScrollableSheet(
                maxChildSize: 0.7,
                minChildSize: 0.2,
                initialChildSize: 0.4,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    padding: screensDefaultPadding,
                    decoration: const BoxDecoration(
                      color: kScaffoldColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: const Divider(
                              color: kTextPrimaryColor,
                              thickness: 3.0,
                            ),
                          ),
                          kSizedBox2,
                          kSizedBox2,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    myRecipesItemModel!.nome,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    'Adicionar aos favoritos',
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                              kSizedBox1,
                              Row(
                                children: [
                                  Text(
                                    myRecipesItemModel!.tipoComida,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 11.sp),
                                  ),
                                  Text(
                                    myRecipesItemModel!.duracao,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 11.sp),
                                  ),
                                ],
                              ),
                              kSizedBox2,
                              kSizedBox2,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            myProfileDetailModel!.minhaImagem),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        myProfileDetailModel!.meuNome,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                color: kTextPrimaryColor,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 11.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        color: kErrorBorderColor,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "${myRecipesItemModel!.numeroCurtidas} Curtidas",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 11.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              kSizedBox2,
                              kDivider,
                              kSizedBox2,
                              Text(
                                'Descrição',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              kSizedBox1,
                              Text(
                                myRecipesItemModel!.descricao,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              kSizedBox2,
                              kDivider,
                              kSizedBox2,
                              Text(
                                'Ingredientes',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              kSizedBox1,
                              Text(
                                getNewLineString(
                                    myRecipesItemModel!.ingredientes.toList(),
                                    '✅'),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: kTextPrimaryColor,
                                        letterSpacing: 0.5),
                              ),
                              kSizedBox2,
                              Text(
                                'Modo de preparar',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              kSizedBox1,
                              Text(
                                getNewLineString(
                                    myRecipesItemModel!.etapasReceita.toList(),
                                    '🔥'),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: kTextPrimaryColor,
                                        letterSpacing: 0.5),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 10,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 12.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF61666E).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0fffffff),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Icon(CupertinoIcons.back),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
