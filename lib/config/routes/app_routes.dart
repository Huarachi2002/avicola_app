import 'package:go_router/go_router.dart';
import 'package:avicola/presentacion/screens/screems.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: ((context, state) => const HomeScreen())),
    GoRoute(
        path: '/home',
        name: HomeScreen.name,
        builder: ((context, state) => const HomeScreen())),
    GoRoute(
        path: '/galpon',
        name: GalponScreen.name,
        builder: ((context, state) => const GalponScreen())),
    GoRoute(
        path: '/produccion',
        name: ProduccionScreen.name,
        builder: ((context, state) => const ProduccionScreen())),
    GoRoute(
        path: '/alertas',
        name: AlertasScreen.name,
        builder: ((context, state) => const AlertasScreen())),
    GoRoute(
        path: '/vacunas',
        name: VacunasScreen.name,
        builder: ((context, state) => const VacunasScreen())),
  ],
);
