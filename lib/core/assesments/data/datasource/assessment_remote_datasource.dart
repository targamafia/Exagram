import 'package:exagram/core/assesments/data/dto/get_answer.dart';
import 'package:exagram/feature/assessment_detail/assessment_detail_controller.dart';

import '../dto/get_freetier_assessment_dto.dart';
import '../dto/get_question_with_answers.dart';

String LOREM =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam non urna lorem. Curabitur facilisis dictum erat sit amet dapibus. Cras tristique, turpis vitae aliquet bibendum, tellus urna pharetra purus, eu viverra justo magna quis leo. Quisque lobortis odio vel quam condimentum, sed pharetra lacus condimentum. Fusce vestibulum malesuada iaculis. Mauris quis urna et massa iaculis tempus quis consectetur augue. Nunc tincidunt sem a justo suscipit, nec feugiat nulla pharetra. Suspendisse nec eros at libero tempus placerat ac at nunc. Maecenas faucibus eros quam, non feugiat velit pellentesque vel. Vivamus maximus sodales ipsum, lobortis maximus tellus molestie non. Donec sed lacus tincidunt ipsum tempus dignissim. Integer feugiat, felis a molestie convallis, dui mauris auctor mi, sed eleifend tortor nisl et mauris. Nulla ac quam consectetur, eleifend neque sed, consequat nunc. Aliquam in posuere orci. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi sed placerat augue.";

/// Interface: Declares the methods needed to fetch/update information to the Assessment API
class AssessmentRemoteDataSource {
  List<GetFreeTierAssessmentDTO> getFreeTierAssessments() {
    throw UnimplementedError();
  }

  Future<List<GetFeatureAssessments>> getFeaturedAssessments() {
    throw UnimplementedError();
  }

  AssessmentDetailDto getAssessmentDetailById(String id) {
    throw UnimplementedError();
  }

  List<GetQuestionWithAnswers> getQuestionsWithAnswersByAssessmentId(
      String assessmentId) {
    throw UnimplementedError();
  }
}

class AssessmentMockAPI implements AssessmentRemoteDataSource {
  @override
  List<GetFreeTierAssessmentDTO> getFreeTierAssessments() {
    return [
      GetFreeTierAssessmentDTO('1', 'Examen preparación CISCO I', 20),
    ];
  }

  @override
  Future<List<GetFeatureAssessments>> getFeaturedAssessments() {
    return Future.delayed(const Duration(seconds: 5), () {
      return [
        GetFeatureAssessments(
            id: '1',
            name: 'Examen Certificación Cisco',
            area: 'Network',
            imgUrl:
                'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80'),
        GetFeatureAssessments(
            id: '2',
            name: 'AWS Associate',
            area: 'Network',
            imgUrl:
                'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80'),
        GetFeatureAssessments(
            id: '3',
            name: 'Project Management Associate',
            area: 'Network',
            imgUrl:
                'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2240&q=80'),
        GetFeatureAssessments(
            id: '4',
            name: 'COMPTIA2',
            area: 'Network',
            imgUrl:
                'https://images.unsplash.com/photo-1580894742597-87bc8789db3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80'),
        GetFeatureAssessments(
            id: '5',
            name: 'Examen Certificación Cisco II',
            area: 'Network',
            imgUrl:
                'https://images.unsplash.com/photo-1496065187959-7f07b8353c55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80'),
      ];
    });
  }

  @override
  AssessmentDetailDto getAssessmentDetailById(String id) {
    if (id == "1") {
      return AssessmentDetailDto(
          id: "1",
          area: "Network",
          title: "Examen Certificación Cisco",
          imgUrl:
              'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
          description:
              'Cisco certifications. Cisco has redesigned our training and certification programs to address today\'s dynamic technologies and prepare students, engineers, and software developers for success in the industry\'s most critical jobs. Use this as a starting point if you\'re interested in a career as a networking professional.',
          numOfQuestions: 22);
    } else if (id == "2") {
      return AssessmentDetailDto(
          id: "2",
          area: "AWS",
          title: "AWS Associate",
          imgUrl:
              'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
          description: LOREM,
          numOfQuestions: 22);
    } else if (id == "3") {
      return AssessmentDetailDto(
          id: "3",
          area: "Project Management",
          title: "Project Management Associate",
          imgUrl:
              'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2240&q=80',
          description: LOREM,
          numOfQuestions: 22);
    } else if (id == "4") {
      return AssessmentDetailDto(
          id: "4",
          area: "Security",
          title: "COMPTIA2",
          imgUrl:
              'https://images.unsplash.com/photo-1580894742597-87bc8789db3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
          description: LOREM,
          numOfQuestions: 22);
    } else {
      return AssessmentDetailDto(
          id: "5",
          area: "Network",
          title: "Examen Certificación Cisco II",
          imgUrl:
              'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
          description: LOREM,
          numOfQuestions: 22);
    }
  }

  @override
  List<GetQuestionWithAnswers> getQuestionsWithAnswersByAssessmentId(
      String assessmentId) {
    return [
      GetQuestionWithAnswers(
          id: "1",
          text:
              "Una universidad construye una nueva residencia estudiantil en su campus. Los trabajadores cavan para instalar las nuevas tuberías de agua de la residencia. Uno de ellos accidentalmente daña el cable de fibra óptica que conecta dos de las residencias existentes al centro de datos del campus. A pesar de que se cortó el cable, los estudiantes de las residencias solo perciben una interrupción muy breve en los servicios de red. ¿Qué característica de la red se demuestra aquí?",
          imgUrl: "",
          answers: [
            GetAnswer(id: '1', text: 'Integridad', isCorrect: false),
            GetAnswer(id: '2', text: 'Calidad de Servicio', isCorrect: false),
            GetAnswer(id: '3', text: 'Tolerancia a fallas', isCorrect: true),
            GetAnswer(id: '4', text: 'Seguridad', isCorrect: false),
            GetAnswer(id: '5', text: 'Escalabilidad', isCorrect: false),
          ]),
      GetQuestionWithAnswers(
          id: "2",
          text:
              "¿Cómo cambia BYOD la forma en que las empresas implementan las redes?",
          imgUrl: "",
          answers: [
            GetAnswer(
                id: '6',
                text:
                    'BYOD brinda flexibilidad con respecto a cuándo y cómo los usuarios pueden acceder a los recursos de red.',
                isCorrect: true),
            GetAnswer(
                id: '7',
                text:
                    'BYOD requiere que las organizaciones compren PC portátiles en lugar de computadoras de escritorio.',
                isCorrect: false),
            GetAnswer(
                id: '8',
                text:
                    'Los usuarios BYOD son responsables de la seguridad de su red, por lo que se reduce la necesidad de políticas de seguridad dentro de la organización.',
                isCorrect: false),
            GetAnswer(
                id: '9',
                text:
                    'Los dispositivos BYOD son más costosos que los dispositivos que compran las organizaciones.',
                isCorrect: false),
          ]),
      GetQuestionWithAnswers(
          id: "3",
          text:
              "Consulte la exhibición. ¿Qué término identifica correctamente el tipo de dispositivo que se incluye en el área B?",
          imgUrl:
              "https://ccnadesdecero.es/wp-content/uploads/2017/11/Pregunta-6-Capitulo-1-CCNA-1.png",
          answers: [
            GetAnswer(id: '1', text: 'Transferencia', isCorrect: false),
            GetAnswer(id: '2', text: 'Origen', isCorrect: false),
            GetAnswer(id: '3', text: 'Tolerancia a fallas', isCorrect: false),
            GetAnswer(id: '4', text: 'Final', isCorrect: false),
            GetAnswer(id: '5', text: 'Intermediario', isCorrect: true),
          ]),
    ];
  }
}

class GetFeatureAssessments {
  final String id;
  final String name;
  final String area;
  final String imgUrl;

  GetFeatureAssessments(
      {required this.id,
      required this.name,
      required this.area,
      required this.imgUrl});
}
