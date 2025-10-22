import 'package:flutter/material.dart';
import 'package:greenflow/presentation/Widgets/Filters.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Menuscreen extends StatefulWidget {
  const Menuscreen({Key? key}) : super(key: key);

  @override
  State<Menuscreen> createState() => _MenuscreenState();
}

class _MenuscreenState extends State<Menuscreen> {
  int _selectedIndex = 0;
  int _selectedGraphics = 0;
    late WebViewController _controller;

  WebViewController _buildWebViewController(String url) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Puedes usar esto para mostrar barra de carga si quieres
          },
          onPageStarted: (String url) {
            debugPrint('Page started: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  void initState() {
    super.initState();
    // Inicializa WebView cuando se crea el estado
    WebViewPlatform.instance;
  }

    void _onItemTappedGraphics(int index) {
    setState(() {
      _selectedGraphics = index;
    });
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget _RenderPage() {
    switch (_selectedIndex) {
      case 0:
        return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Curva decorativa
        Container(
          height: 20,
          decoration: BoxDecoration(
            color: Color(0xFF5DDDBC),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
        ),
        
        // Header principal con logo y título
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icono de la app
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF5DDDBC),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF5DDDBC).withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.eco,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              
              // Título y descripción
              Text(
                'GreenFlow',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C5530),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Datos especializados en movilidad verde',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'para Colombia',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        
        // Tarjeta informativa principal
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5DDDBC).withOpacity(0.1),
                  Color(0xFF5DDDBC).withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFF5DDDBC).withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xFF5DDDBC),
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Sobre la Aplicación',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C5530),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'GreenFlow centraliza datos sobre vehículos eléctricos en Colombia, facilitando el acceso a información confiable y estructurada para usuarios interesados en la movilidad sostenible.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(height: 24),
        
        // Sección de características
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Características Principales',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C5530),
            ),
          ),
        ),
        
        SizedBox(height: 16),
        
        // Lista de características
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _buildFeatureItem(
                Icons.electric_car,
                'Información de Vehículos',
                'Datos detallados sobre vehículos eléctricos, características técnicas y especificaciones.',
              ),
              SizedBox(height: 16),
              _buildFeatureItem(
                Icons.analytics,
                'Análisis y Comparación',
                'Herramientas para comparar modelos según autonomía, tipo de batería y costo de mantenimiento.',
              ),
              SizedBox(height: 16),
              _buildFeatureItem(
                Icons.map,
                'Navegación Intuitiva',
                'Interfaz fácil de usar con navegación optimizada para una mejor experiencia.',
              ),
              SizedBox(height: 16),
              _buildFeatureItem(
                Icons.trending_up,
                'Datos Actualizados',
                'Información constantemente actualizada sobre el mercado de movilidad eléctrica.',
              ),
            ],
          ),
        ),
        
        SizedBox(height: 24),
        
        // Sección de estadísticas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF5DDDBC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  'Impacto en Colombia',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Reducción', 'Emisiones'),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    _buildStatItem('Optimización', 'Energética'),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    _buildStatItem('Movilidad', 'Sostenible'),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(height: 24),
        
        // Footer informativo
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: Color(0xFF5DDDBC),
                  size: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explora los Gráficos',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C5530),
                        ),
                      ),
                      Text(
                        'Descubre análisis detallados en la sección de gráficos',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(height: 30),
      ],
    ),
  ); // Aquí puedes agregar el contenido de la página de inicio
      case 1:
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white, // o cualquier fondo que prefieras
                      child: Center(
                        child: _RenderGraphics(),
                        // Puedes reemplazar esto con cualquier widget
                      ),
                    ),
                  ),
                  BottomNavigationBar(
                    backgroundColor: Colors.white,
                    selectedItemColor: Color(0xFF5DDDBC),
                    unselectedItemColor: Colors.grey,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _selectedGraphics,
                    onTap: _onItemTappedGraphics,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.show_chart),
                        label: 'Tendencias',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.stacked_bar_chart),
                        label: 'Comparativas',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.bar_chart),
                        label: 'Estadísticas',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.donut_large),
                        label: 'Distribución',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ); // Aquí puedes agregar el contenido de la página de explorar
      case 2:
        return VehiclesTablePage(); // Aquí puedes agregar el contenido de la página de añadir
      case 3:
        return Container(); // Aquí puedes agregar el contenido de la página de mensajes
      case 4:
        return Container(); // Aquí puedes agregar el contenido de la página de ajustes
      default:
        return Container();
    }
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFF5DDDBC).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Color(0xFF5DDDBC),
            size: 24,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C5530),
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Función auxiliar para estadísticas
Widget _buildStatItem(String title, String subtitle) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white.withOpacity(0.8),
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}


  Widget _RenderGraphics() {
  switch (_selectedGraphics) {
    case 0:
      return WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://app.powerbi.com/view?r=eyJrIjoiY2IxZjRjZDYtYTY0My00MTQzLTg0ZjYtNmZjMGNkMGM2YjEzIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9')),
      );
    case 1:
      return WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://app.powerbi.com/view?r=eyJrIjoiYmJhYzFiYzMtYjA5Yi00ODExLTg5MzUtODRiY2NlZWU1ODQyIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9')),
      );
    case 2:
      return WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://app.powerbi.com/view?r=eyJrIjoiMzM4NjUyNGEtZDBjNi00ZmYwLTg3NDctZDc5NDRiNmFlOWM2IiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9')),
      );
    case 3:
      return WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://app.powerbi.com/view?r=eyJrIjoiNDJhM2QyZDEtYjU3OC00Nzc2LWJmYmQtNmM2ZWZmNjk1ZDJlIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9')),
      );
    default:
      return Center(child: Text('Selecciona una gráfica'));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF5DDDBC),
        elevation: 0,
        title: Text(
          'Bienvenido',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.notifications_outlined, color: Colors.white),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.person_outline, color: Colors.white),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: _RenderPage(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFF5DDDBC),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph_outlined),
                label: 'Gráficos',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.add_circle_outline),
              //   label: 'Añadir',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.chat_bubble_outline),
              //   label: 'Mensajes',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.table_chart_outlined),
                label: 'Listado',
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF5DDDBC).withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: Color(0xFF5DDDBC),
              size: 32,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedItem(String title, String rating, String description) {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF5DDDBC), Color(0xFF5DDDBC).withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF5DDDBC).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xFF5DDDBC),
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          Text(
                            rating,
                            style: TextStyle(
                              color: Color(0xFF5DDDBC),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String time, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF5DDDBC).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                Icons.notifications,
                color: Color(0xFF5DDDBC),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}