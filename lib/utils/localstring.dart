import 'package:get/get.dart';
import 'package:newsreaderapp/controller/newsController.dart';

class LocalString extends Translations {

  NewsController newsController=Get.put(NewsController());
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'News': 'News',
          'Flash': 'Flash',
          'Settings': 'Settings',
          'Light theme': 'Light theme',
          'Dark theme': 'Dark theme',
          'Change Language': 'Change Language',
          'News Details':'News Details',
          'Internet connection not found.':'Internet connection not found.',
          'No data found':'No data found'

        },
        'sp_Spanish': {
          'News': 'Noticias',
          'Flash': 'Flash',
          'Settings': 'Ajustes',
          'Light theme': 'Tema ligero',
          'Dark theme': 'Tema oscuro',
          'Change Language': 'Cambiar idioma',
          'News Details':'Detalles de noticias',
          'Internet connection not found.':'Conexión a Internet no encontrada',
          'No data found':'Datos no encontrados'
        }
      };

}
