import 'package:flutter/material.dart';

class VehiclesTablePage extends StatefulWidget {
  const VehiclesTablePage({Key? key}) : super(key: key);

  @override
  State<VehiclesTablePage> createState() => _VehiclesTablePageState();
}

class _VehiclesTablePageState extends State<VehiclesTablePage> {
  final Color primaryGreen = const Color(0xFF64D2A8);
  
  // Data quemada - puedes reemplazar esto con tu fuente de datos real
  List<Map<String, dynamic>> vehiclesData = [
    {
      'estado': 'ACTIVO',
      'fechaRegistro': '2022 Jun 31',
      'año': '2022',
      'clase': 'AUTOMOVIL',
      'tipo': 'BUS',
      'servicio': 'Publico',
      'marca': 'BYD',
      'linea': 'BC11S01',
      'carroceria': 'CERRADA',
      'cilindrada': '',
      'modelo': 'PASAJEROS',
      'organismo': 'SDM - BOGOTA',
      'municipio': 'BOGOTA',
      'departamento': 'Bogota D.C.',
      'capacidad': '49',
      'peso': '20.00'
    },
    {
      'estado': 'ACTIVO',
      'fechaRegistro': '2022 Oct 21',
      'año': '2022',
      'clase': 'AUTOMOVIL',
      'tipo': 'CAMIONETA',
      'servicio': 'Particular',
      'marca': 'BYD',
      'linea': 'YUAN PRO',
      'carroceria': 'WAGON',
      'cilindrada': '0',
      'modelo': '',
      'organismo': 'INSTITUTO PEREIRA',
      'municipio': 'Risaralda',
      'departamento': '',
      'capacidad': '',
      'peso': '1.96'
    },
    {
      'estado': 'ACTIVO',
      'fechaRegistro': '2015 Sep 26',
      'año': '2015',
      'clase': 'MOTO',
      'tipo': 'MOTOCICLETA',
      'servicio': 'Particular',
      'marca': 'E-MOTOR',
      'linea': 'VITA',
      'carroceria': 'SIN CARROCERIA',
      'cilindrada': '0',
      'modelo': '',
      'organismo': 'STRIA TTOP',
      'municipio': 'FLORENCIA',
      'departamento': 'Caqueta',
      'capacidad': '',
      'peso': ''
    },
    {
      'estado': 'ACTIVO',
      'fechaRegistro': '2022 Aug 1',
      'año': '2022',
      'clase': 'AUTOMOVIL',
      'tipo': 'CAMIONETA',
      'servicio': 'Publico',
      'marca': 'DONGFENG',
      'linea': 'DFA5030XX',
      'carroceria': 'PANEL',
      'cilindrada': '',
      'modelo': 'CARGA',
      'organismo': 'STRIA TTOP',
      'municipio': 'FUNZA',
      'departamento': 'Cundinamarca',
      'capacidad': '845',
      'peso': '2.50'
    },
    {
      'estado': 'ACTIVO',
      'fechaRegistro': '2021 Oct 25',
      'año': '2021',
      'clase': 'AUTOMOVIL',
      'tipo': 'CAMIONETA',
      'servicio': 'Particular',
      'marca': 'BYD',
      'linea': 'SONG PRO',
      'carroceria': 'WAGON',
      'cilindrada': '0',
      'modelo': '',
      'organismo': 'STRIA TTEV',
      'municipio': 'EL ROSAL',
      'departamento': 'Cundinamarca',
      'capacidad': '',
      'peso': '2.17'
    },
    {
      'estado': 'ACTIVO',
      'fechaRegistro': '2022 Aug 05',
      'año': '2022',
      'clase': 'AUTOMOVIL',
      'tipo': 'AUTOMOVIL',
      'servicio': 'Particular',
      'marca': 'MINI',
      'linea': 'COOPER SE',
      'carroceria': 'HATCH BACK',
      'cilindrada': '0',
      'modelo': '',
      'organismo': 'STRIA TTOP',
      'municipio': 'SABANETA',
      'departamento': 'Antioquia',
      'capacidad': '',
      'peso': '1.48'
    }
  ];

  List<Map<String, dynamic>> filteredData = [];
  
  // Filtros
  String? selectedMarca;
  String? selectedTipo;
  String? selectedServicio;
  String? selectedDepartamento;

  // Listas para los filtros
  List<String> marcas = [];
  List<String> tipos = [];
  List<String> servicios = [];
  List<String> departamentos = [];

  @override
  void initState() {
    super.initState();
    filteredData = List.from(vehiclesData);
    _initializeFilterLists();
  }

  void _initializeFilterLists() {
    // Extraer valores únicos para los filtros
    marcas = vehiclesData.map((e) => e['marca'].toString()).toSet().toList();
    tipos = vehiclesData.map((e) => e['tipo'].toString()).toSet().toList();
    servicios = vehiclesData.map((e) => e['servicio'].toString()).toSet().toList();
    departamentos = vehiclesData.map((e) => e['departamento'].toString()).where((e) => e.isNotEmpty).toSet().toList();
    
    marcas.sort();
    tipos.sort();
    servicios.sort();
    departamentos.sort();
  }

  void _applyFilters() {
    setState(() {
      filteredData = vehiclesData.where((vehicle) {
        bool matchesMarca = selectedMarca == null || vehicle['marca'] == selectedMarca;
        bool matchesTipo = selectedTipo == null || vehicle['tipo'] == selectedTipo;
        bool matchesServicio = selectedServicio == null || vehicle['servicio'] == selectedServicio;
        bool matchesDepartamento = selectedDepartamento == null || vehicle['departamento'] == selectedDepartamento;
        
        return matchesMarca && matchesTipo && matchesServicio && matchesDepartamento;
      }).toList();
    });
  }

  void _clearFilters() {
    setState(() {
      selectedMarca = null;
      selectedTipo = null;
      selectedServicio = null;
      selectedDepartamento = null;
      filteredData = List.from(vehiclesData);
    });
  }

  Widget _buildFilterDropdown(String label, String? value, List<String> options, Function(String?) onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: primaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryGreen.withOpacity(0.3))
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          value: value,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: primaryGreen),
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option, style: const TextStyle(fontSize: 12)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Listado de Vehículos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        backgroundColor: primaryGreen,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Filtros
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.filter_list, color: primaryGreen, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Filtros',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800]
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _clearFilters,
                      child: Text('Limpiar', style: TextStyle(color: primaryGreen)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Primera fila de filtros
                Row(
                  children: [
                    Expanded(
                      child: _buildFilterDropdown('Marca', selectedMarca, marcas, (value) {
                        selectedMarca = value;
                        _applyFilters();
                      }),
                    ),
                    Expanded(
                      child: _buildFilterDropdown('Tipo', selectedTipo, tipos, (value) {
                        selectedTipo = value;
                        _applyFilters();
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Segunda fila de filtros
                Row(
                  children: [
                    Expanded(
                      child: _buildFilterDropdown('Servicio', selectedServicio, servicios, (value) {
                        selectedServicio = value;
                        _applyFilters();
                      }),
                    ),
                    Expanded(
                      child: _buildFilterDropdown('Departamento', selectedDepartamento, departamentos, (value) {
                        selectedDepartamento = value;
                        _applyFilters();
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Contador de resultados
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: primaryGreen.withOpacity(0.1),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: primaryGreen),
                const SizedBox(width: 8),
                Text(
                  'Mostrando ${filteredData.length} de ${vehiclesData.length} vehículos',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ),
          
          // Tabla
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(primaryGreen.withOpacity(0.1)),
                    dataRowHeight: 56,
                    headingRowHeight: 48,
                    columnSpacing: 20,
                    horizontalMargin: 16,
                    columns: [
                      DataColumn(
                        label: Text('ESTADO', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('FECHA REG.', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('AÑO', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('CLASE', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('TIPO', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('SERVICIO', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('MARCA', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('LÍNEA', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('CARROCERÍA', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('MUNICIPIO', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('DEPARTAMENTO', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                      DataColumn(
                        label: Text('PESO', style: TextStyle(fontWeight: FontWeight.w600, color: primaryGreen, fontSize: 12)),
                      ),
                    ],
                    rows: filteredData.map((vehicle) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: vehicle['estado'] == 'ACTIVO' ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                vehicle['estado'] ?? '',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: vehicle['estado'] == 'ACTIVO' ? Colors.green[700] : Colors.red[700],
                                ),
                              ),
                            ),
                          ),
                          DataCell(Text(vehicle['fechaRegistro'] ?? '', style: const TextStyle(fontSize: 11))),
                          DataCell(Text(vehicle['año'] ?? '', style: const TextStyle(fontSize: 11))),
                          DataCell(Text(vehicle['clase'] ?? '', style: const TextStyle(fontSize: 11))),
                          DataCell(Text(vehicle['tipo'] ?? '', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500))),
                          DataCell(Text(vehicle['servicio'] ?? '', style: const TextStyle(fontSize: 11))),
                          DataCell(Text(vehicle['marca'] ?? '', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: primaryGreen))),
                          DataCell(Text(vehicle['linea'] ?? '', style: const TextStyle(fontSize: 11))),
                          DataCell(Text(vehicle['carroceria'] ?? '', style: const TextStyle(fontSize: 11))),
                          DataCell(Text(vehicle['municipio'] ?? '', style: const TextStyle(fontSize: 11))),
                          DataCell(Text(vehicle['departamento'] ?? '', style: const TextStyle(fontSize: 11))),
                          DataCell(Text(vehicle['peso'] ?? '', style: const TextStyle(fontSize: 11))),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}