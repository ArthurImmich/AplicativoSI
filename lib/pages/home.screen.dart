import 'package:aplicativosi/models/event.model.dart';
import 'package:aplicativosi/router/delegate.router.dart';
import 'package:aplicativosi/router/pages.router.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Event> _events = [
    Event(
      title: 'Lorem ipsum dolor...',
      description: 'Lorem ipsum dolor...',
    ),
    Event(
      title: 'Lorem ipsum dolor...',
      description: 'Lorem ipsum dolor...',
    ),
    Event(
      title: 'Lorem ipsum dolor...',
      description: 'Lorem ipsum dolor...',
    ),
    Event(
      title: 'Lorem ipsum dolor...',
      description: 'Lorem ipsum dolor...',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Olá Undefined!',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Container(
                      width: 72,
                      height: 72,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/891/600',
                      ),
                    )
                  ],
                ),
              ),
              GridView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  InkResponse(
                    onTap: () => (Router.of(context).routerDelegate as Delegate)
                        .push(schedulesPageConfig),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFFF5F5F5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                      ),
                      child: Center(
                        child: Text(
                          'Horários',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                  InkResponse(
                    onTap: () => (Router.of(context).routerDelegate as Delegate)
                        .push(eventsPageConfig),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFFF5F5F5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                      ),
                      child: Center(
                        child: Text(
                          'Eventos',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                  InkResponse(
                    onTap: () => (Router.of(context).routerDelegate as Delegate)
                        .push(filesPageConfig),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFFF5F5F5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                      ),
                      child: Center(
                        child: Text(
                          'Arquivos',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                  InkResponse(
                    onTap: () => (Router.of(context).routerDelegate as Delegate)
                        .push(contactsPageConfig),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderOnForeground: true,
                      elevation: 0,
                      color: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                      ),
                      child: Center(
                        child: Text(
                          'Contatos',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                child: Text(
                  'Próximos Eventos',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: ListView.builder(
                    itemCount: _events.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            _events[index].title!,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            _events[index].description!,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20,
                          ),
                          tileColor: const Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
