import 'package:exagram/feature/profile/profile_controller.dart';
import 'package:exagram/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'MRP Capacitaciones',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child:  InkWell(
                    onTap: () => (
                        Get.to(()=> ProfilePage())
                    ),
                    child: Icon(Icons.account_circle_outlined, color: Colors.black)
                )
            )
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){ Get.back(); },
            color: Colors.black,
          ),
          backgroundColor: Theme.of(context).canvasColor,
        ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top:48.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage('https://buffer.com/library/content/images/2020/05/Kevan-Lee.png')
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:16.0, bottom: 8.0),
                child: Text(
                  //controller.profile.username  Ahorita solo lo hare estático
                  'Fredy Herzog',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  //controller.profile. info de cuando creo la cuenta
                  'Cuenta activa desde el: 23 de Septiembre de 2022',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:32.0, bottom:16.0, left:16.0),
                child: Text(
                  'Últimos 5 exámenes',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:Table(
                  border: TableBorder.all(
                      color: Theme.of(context).dividerColor,
                      style: BorderStyle.solid,
                      width: 2),
                  columnWidths: {
                    0: FlexColumnWidth(7),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow( children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Padding(padding: const EdgeInsets.only(left: 4.0, top: 6.0, bottom: 6.0),
                                child: Text('Examen', style: Theme.of(context).textTheme.subtitle1))]),
                      Column(children:[Text('75/100', style: Theme.of(context).textTheme.subtitle1)]),
                      Column(children:[Icon(Icons.replay, color: Colors.black,)]),
                    ]),
                    TableRow( children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[Padding(padding: const EdgeInsets.only(left: 4.0, top: 6.0, bottom: 6.0),
                              child: Text('Examen', style: Theme.of(context).textTheme.subtitle1))]),
                      Column(children:[Text('100/100', style: Theme.of(context).textTheme.subtitle1)]),
                      Column(children:[Icon(Icons.replay, color: Colors.black,)]),
                    ]),
                    TableRow( children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[Padding(padding: const EdgeInsets.only(left: 4.0, top: 6.0, bottom: 6.0),
                              child: Text('Examen', style: Theme.of(context).textTheme.subtitle1))]),
                      Column(children:[Text('40/100',  style: Theme.of(context).textTheme.subtitle1)]),
                      Column(children:[Icon(Icons.replay, color: Colors.black,)]),
                    ]),
                    TableRow( children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[Padding(padding: const EdgeInsets.only(left: 4.0, top: 6.0, bottom: 6.0),
                              child: Text('Examen', style: Theme.of(context).textTheme.subtitle1))]),
                      Column(children:[Text('100/100', style: Theme.of(context).textTheme.subtitle1)]),
                      Column(children:[Icon(Icons.replay, color: Colors.black,)]),
                    ]),
                    TableRow( children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[Padding(padding: const EdgeInsets.only(left: 4.0, top: 6.0, bottom: 6.0),
                              child: Text('Examen', style: Theme.of(context).textTheme.subtitle1))]),
                      Column(children:[Text('40/100', style: Theme.of(context).textTheme.subtitle1)]),
                      Column(children:[Icon(Icons.replay, color: Colors.black,)]),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}