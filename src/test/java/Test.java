import database.Database;

import java.sql.SQLException;

public class Test {
    public static void main(String[] args) {
        Database database = new Database();
        database.testConnection();
    }
}
