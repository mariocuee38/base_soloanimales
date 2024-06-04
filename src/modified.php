<?php

 define('MARIADB_HOST', 'mysql');

 define('MARIADB_DATABASE', 'zoologico');

 define('MARIADB_USER', 'user');

 define('MARIADB_PASSWORD', 'password');

 $conn = new mysqli(MARIADB_HOST, MARIADB_USER, MARIADB_PASSWORD,MARIADB_DATABASE);

// Consulta para los animales
 $sql_animales = "SELECT Animales.ID, Animales.Nombre AS NombreAnimal, Animales.Especie, Animales.Edad, Habitat.Nombre AS NombreHabitat FROM Animales JOIN Habitat ON Animales.HabitatID = Habitat.ID";
 $result_animales = $conn->query($sql_animales);

// Consulta para obtener datos de los empleados
 $sql_empleados = "SELECT Empleados.ID, Empleados.Nombre, Empleados.Tipo, Habitat.Nombre AS NombreHabitat FROM Empleados LEFT JOIN Cuidador ON Empleados.ID = Cuidador.EmpleadoID LEFT JOIN Limpiador ON Empleados.ID = Limpiador.EmpleadoID LEFT JOIN Habitat ON Cuidador.Recinto = Habitat.ID OR Limpiador.Recinto1 = Habitat.ID OR Limpiador.Recinto2 = Habitat.ID";
 $result_empleados = $conn->query($sql_empleados);
?>

 <!DOCTYPE html>
 <html lang="es">
 <head>
    <meta charset="UTF-8">
    <title>Información del Zoológico</title>
 </head>
 <body>
    <h1>Información del Zoológico</h1>
    <h2>Animales</h2>
    <?php
    // Mostrar resultados en una tabla para animales
    if ($result_animales->num_rows > 0) {
        echo "<table border='1'>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Especie</th>
                    <th>Edad</th>
                    <th>Hábitat</th>
                </tr>";
        while ($row = $result_animales->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['ID']}</td>
                    <td>{$row['NombreAnimal']}</td>
                    <td>{$row['Especie']}</td>
                    <td>{$row['Edad']}</td>
                    <td>{$row['NombreHabitat']}</td>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "0 resultados";
    }
    ?>

    <h2>Empleados</h2>
    <?php
    // Mostrar resultados en una tabla para empleados
    if ($result_empleados->num_rows > 0) {
        echo "<table border='1'>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Hábitat</th>
                </tr>";
        while ($row = $result_empleados->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['ID']}</td>
                    <td>{$row['Nombre']}</td>
                    <td>{$row['Tipo']}</td>
                    <td>{$row['NombreHabitat']}</td>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "0 resultados";
    }

    // Cerrar la conexión
    $conn->close();
    ?>
 </body>
 </html>
