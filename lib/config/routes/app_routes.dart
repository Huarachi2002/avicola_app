import 'package:go_router/go_router.dart';
import 'package:avicola/features/auth/presentacion/screens/screems.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: ((context, state) => const LoginScreen())),
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
    GoRoute(
        path: '/gestion-usuario',
        name: GestionUsuarioScreen.name,
        builder: ((context, state) => const GestionUsuarioScreen())),
    GoRoute(
        path: '/gestion-vacuna',
        name: GestionVacunasScreen.name,
        builder: ((context, state) => const GestionVacunasScreen())),
  ],
);
