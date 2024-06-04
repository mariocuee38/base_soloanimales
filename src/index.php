<?php
 define('MARIADB_HOST', 'mysql');

 define('MARIADB_DATABASE', 'zoologico');

 define('MARIADB_USER', 'user');

 define('MARIADB_PASSWORD', 'password');

 $conn = new mysqli(MARIADB_HOST, MARIADB_USER, MARIADB_PASSWORD,MARIADB_DATABASE);

 $sql = "SELECT Animales.ID, Animales.Nombre AS NombreAnimal, Animales.Especie, Animales.Edad, Habitat.Nombre AS NombreHabitat FROM Animales JOIN Habitat ON Animales.HabitatID = Habitat.ID";
 $result = $conn->query($sql);

 if ($result->num_rows > 0) {
    echo "<table border='1'>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Especie</th>
                <th>Edad</th>
                <th>Habitat</th>
            </tr>";
    while($row = $result->fetch_assoc()) {
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
    echo "0 results";
 }

 $conn->close();
?>
