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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Olá Undefined!',
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/seed/891/600',
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildListDelegate([
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
                        .push(schedulesPageConfig),
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
                  ),
                ]),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: Text(
                    'Próximos Eventos',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
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
                  childCount: _events.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
