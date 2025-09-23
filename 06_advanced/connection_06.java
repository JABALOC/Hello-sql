// Connections 

import java.sql.*;

public class connection_06 {

    public static void main(String[] args) {
        String url = "jdbc:mysql://127.0.0.1:3307/hello_mysql";
        String usuario = "root";
        String contraseña = "Misbasesdedatos1";


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(url, usuario, contraseña);

            Statement statement = conexion.createStatement();

            String consulta = "SELECT * FROM users WHERE NAME = ?";
            ResultSet resultado = statement.executeQuery(consulta);

            ResultSetMetaData metaData = resultado.getMetaData();
            int columnCount = metaData.getColumnCount();

            System.out.println("\n-------------------------------------");
            System.out.println("DATOS TABLA 'CHALLENGES'");
            System.out.println("-------------------------------------");
            while (resultado.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnName(i);
                    String value = resultado.getString(i);
                    System.out.println(columnName + ": " + value);
                }
                System.out.println("-------------------------------------");
            }

            resultado.close();
            statement.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

