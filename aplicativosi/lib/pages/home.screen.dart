import 'package:aplicativosi/blocs/events.bloc.dart';
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
  late final EventsBloc _eventsBloc;

  @override
  void initState() {
    super.initState();
    _eventsBloc = EventsBloc();
    _eventsBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Olá Undefined!',
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: Center(
                child: InkWell(
                  radius: 100,
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/seed/891/600',
                      ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      enableDrag: true,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                FractionallySizedBox(
                                  widthFactor: 0.25,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                    ),
                                    child: Container(
                                      height: 5.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(2.5)),
                                      ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text("Horários"),
                                  trailing: Icon(Icons.schedule),
                                  onTap: () => (Router.of(context)
                                          .routerDelegate as Delegate)
                                      .push(schedulesPageConfig),
                                ),
                                Divider(),
                                ListTile(
                                  title: Text("Eventos"),
                                  trailing: Icon(Icons.event),
                                  onTap: () => (Router.of(context)
                                          .routerDelegate as Delegate)
                                      .push(eventsPageConfig),
                                ),
                                Divider(),
                                ListTile(
                                  title: Text("Arquivos"),
                                  trailing: Icon(Icons.file_copy),
                                  onTap: () => (Router.of(context)
                                          .routerDelegate as Delegate)
                                      .push(filesPageConfig),
                                ),
                                Divider(),
                                ListTile(
                                  title: Text("Contatos"),
                                  trailing: Icon(Icons.person),
                                  onTap: () => (Router.of(context)
                                          .routerDelegate as Delegate)
                                      .push(contactsPageConfig),
                                ),
                                Divider(),
                                ListTile(
                                  title: Text("Notificações"),
                                  trailing: Icon(Icons.notifications),
                                  onTap: () => (Router.of(context)
                                          .routerDelegate as Delegate)
                                      .push(notificationsPageConfig),
                                ),
                                Divider(),
                                ListTile(
                                  title: Text("Sair"),
                                  trailing: Icon(Icons.logout),
                                  onTap: () {
                                    (Router.of(context).routerDelegate
                                            as Delegate)
                                        .logOut();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 30,
                      isScrollControlled: true,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              sliver: SliverGrid(
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
                  ),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: Text(
                    'Próximos Eventos',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverFillRemaining(
                child: FutureBuilder(
                  future: _eventsBloc.data,
                  builder: (context, AsyncSnapshot<List<Event>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: ListTile(
                              onTap: () {},
                              title: Text(
                                snapshot.data![index].title!,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              subtitle: Text(
                                snapshot.data![index].description!,
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
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
