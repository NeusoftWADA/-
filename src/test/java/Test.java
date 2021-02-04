import database.Database;
import entity.Knowledgedata;
import org.apache.commons.beanutils.BasicDynaBean;
import org.apache.commons.beanutils.RowSetDynaClass;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class Test {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        /**
         * 测试数据库连接是否成功，需要连接vpn，运行此测试类会打印出服务器地址
         *  com.mysql.jdbc.JDBC4Connection@4b85612c
         */
        Database database = new Database();
        database.getConnection();
//        System.out.println(database.getConnection());

//        String str = "Java,C语言,Python";
//        String[] res = str.split(",");
//        for ( String s : res ) {
//            System.out.println(s);
//        }

//        Vector<Integer> set_cate = new Vector<>();
//        set_cate.add(1);
//        set_cate.add(2);
//        System.out.println(set_cate.get(0));

        String sql = "SELECT * FROM `knowledge` ORDER BY createTime DESC LIMIT 10";

        PreparedStatement preparedStatement1 = database.getConnection().prepareStatement(sql);
        ResultSet resultSet1 = preparedStatement1.executeQuery();
        List<Knowledgedata> knowledgedataList = new ArrayList<Knowledgedata>();
        while ( resultSet1.next() ) {
            Knowledgedata knowledgedata = new Knowledgedata(resultSet1.getInt(1), resultSet1.getInt(2), resultSet1.getString(3), resultSet1.getString(4), resultSet1.getString(5), resultSet1.getString(6));
            knowledgedataList.add(knowledgedata);

        }
        System.out.println(knowledgedataList.get(0).getTitle());


    }
}
