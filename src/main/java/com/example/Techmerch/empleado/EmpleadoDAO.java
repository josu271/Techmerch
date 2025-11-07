package com.example.Techmerch.empleado;

import java.util.List;

public interface EmpleadoDAO {
    List<Empleado> listarEmpleados();
    Empleado obtenerEmpleadoPorId(int id);
}