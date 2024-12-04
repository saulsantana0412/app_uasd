import 'package:flutter/material.dart';
import 'package:uasd_app/components/cards/news_card.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/models/new.dart';
import 'package:uasd_app/services/content_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  List<New> _news = []; // Lista para almacenar las noticias obtenidas.
  bool _loading = true; // Variable para manejar el estado de carga.

  // Función que obtiene las noticias desde el servicio.
  Future <void> fetchNews() async{
    final data = await ContentService.fetchNews(); // Llama al servicio para obtener las noticias.
    if(data != null && mounted){ // Verifica si los datos no son nulos y si el widget está montado.
      _news = data; // Asigna las noticias obtenidas a la lista.
      setState(() {
        if(mounted){
          _loading = false; // Cambia el estado de carga a falso después de obtener las noticias.
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews(); // Llama a la función para obtener las noticias cuando se inicializa la pantalla.
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto actual de la aplicación.

    return RefreshIndicator(
      onRefresh: ()=>fetchNews(), // Función que se llama al hacer pull-to-refresh.
      color: AppColors.darkblue, // Color del indicador de carga.
      backgroundColor: AppColors.white, // Color de fondo del indicador de carga.
      child: Container(
        padding: const EdgeInsets.all(20), // Padding alrededor del contenedor principal.
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor, // Color de fondo de la pantalla.
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alineación de los elementos a la izquierda.
          children: [
            Text("Noticias de la UASD", style: textTheme.titleMedium,), // Título de la pantalla.
            const SizedBox(height: 20,), // Espaciado entre el título y el contenido.
            if(_loading) const CustomCircularProgress(), // Muestra el círculo de carga mientras las noticias se están obteniendo.
            if (!_loading && _news.isEmpty)
              Text("Aun no hay noticias publicadas", style: Theme.of(context).textTheme.bodyMedium), // Mensaje cuando no hay noticias disponibles.
            if(!_loading && _news.isNotEmpty) 
              Expanded(
                child: ListView.builder(
                  itemCount: _news.length, // Número de noticias para mostrar.
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NewsCard(newArticle: _news[index]), // Muestra una tarjeta de noticia usando el componente NewsCard.
                        const SizedBox(height: 20,) // Espaciado entre las tarjetas de noticias.
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
