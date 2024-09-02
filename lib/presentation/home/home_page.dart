import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistema_matricula/domain/login/models/user_model.dart';
import 'package:sistema_matricula/presentation/home/controller/home_controller.dart';
import 'package:sistema_matricula/presentation/manage_courses/menage_courses_page.dart';
import 'package:sistema_matricula/presentation/manage_students/manage_students_page.dart';
import 'package:sistema_matricula/presentation/manage_subject/menage_subject_page.dart';
import 'package:sistema_matricula/presentation/manage_teachers/manage_teachers_page.dart';
import 'package:sistema_matricula/presentation/registration/registration_page.dart';
import 'package:sistema_matricula/shared/app_routes/paths.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final UserType userType = controller.user!.type;
    return DefaultTabController(
      length: _getTabLength(userType),
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá, ${controller.user!.name}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                )
              ),
              Text(
                controller.user!.type.name,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  fontWeight: FontWeight.normal,
                )
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(
                  Icons.logout, 
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () => _showLogoutDialog(context),
              ),
            ),
          ],
          backgroundColor: Colors.grey[100],
          bottom: TabBar(
            tabs: _buildTabs(userType),
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey[700],
          ),
        ),
        body: TabBarView(
          children: _buildTabViews(userType),
        ),
        backgroundColor: Colors.grey[100],
      ),
    );
  }

  int _getTabLength(UserType userType) {
    switch (userType) {
      case UserType.student:
        return 4;
      case UserType.secretary:
        return 6;
      case UserType.teacher:
        return 1;
      default:
        return 0;
    }
  }

  List<Tab> _buildTabs(UserType userType) {
    switch (userType) {
      case UserType.student:
        return [
          const Tab(text: "Matricular"),
          const Tab(text: "Cancelar"),
          const Tab(text: "Minhas Disciplinas"),
          const Tab(text: "Boleto"),
        ];
      case UserType.secretary:
        return [
          const Tab(text: "Cursos"),
          const Tab(text: "Disciplinas"),
          const Tab(text: "Professores"),
          const Tab(text: "Alunos"),
          const Tab(text: "Relatórios"),
          const Tab(text: "Matrículas"),
        ];
      case UserType.teacher:
        return [
          const Tab(text: "Ver Alunos"),
        ];
      default:
        return [];
    }
  }

  List<Widget> _buildTabViews(UserType userType) {
    switch (userType) {
      case UserType.student:
        return [
          const RegistrationPage(),
          _buildMenuOption("Cancelar Matrícula", "Paths.cancelEnrollment"),
          _buildMenuOption("Ver Minhas Disciplinas", "Paths.myCourses"),
          _buildMenuOption("Gerar Boleto de Pagamento", "Paths.generateInvoice"),
        ];
      case UserType.secretary:
        return [
          ManageCoursesPage(),
          const ManageSubjectPage(),
          const ManageTeachersPage(),
          const ManageStudentsPage(),
          _buildMenuOption("Relatórios", "Paths.generateReports"),
          _buildMenuOption("Matrículas", "Paths.viewEnrollments"),
        ];
      case UserType.teacher:
        return [
          _buildMenuOption("Ver Alunos Matriculados", "Paths.viewEnrolledStudents"),
        ];
      default:
        return [];
    }
  }

  Widget _buildMenuOption(String title, String route) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirmação de Saída"),
        content: const Text("Você deseja sair do sistema?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              // Ação para deslogar ou sair do sistema
              Navigator.of(context).pop(); // Fecha o diálogo
              Get.offAllNamed(Paths.login); // Redireciona para a tela de login
            },
            child: const Text("Sair"),
          ),
        ],
      );
    },
  );
}
