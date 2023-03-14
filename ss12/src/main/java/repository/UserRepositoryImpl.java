package repository;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository{

    public static final String SELECT_ALL_USER = "select * from user_manage";
    private static final String SELECT_USER_BY_COUNTRY = "select * from user_manage where user_country like ?;";
    public static final String INSERT = "insert into user_manage(user_id,user_name,user_email,user_country)" +
            "(value(?,?,?,?))";
    private static final String SORT_USER_BY_NAME = "select * from user_manage order by user_name;";

    List<User> userList = new ArrayList<>();

    @Override
    public List<User> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<User> userList = new ArrayList<>();

        if (connection != null){
            try {
                statement = connection.prepareStatement(SELECT_ALL_USER);
                resultSet = statement.executeQuery();

                User user = null;
                while (resultSet.next()){
                    int id = resultSet.getInt("user_id");
                    String name = resultSet.getString("user_name");
                    String email = resultSet.getString("user_email");
                    String country = resultSet.getString("user_country");
                    user = new User(id,name,email,country);
                    userList.add(user);
                }
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                try {
                    resultSet.close();
                    statement.close();
                }catch (SQLException e){
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
        return userList;
    }

    @Override
    public void save(User user) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        if (connection != null){
            try {
                statement = connection.prepareStatement(INSERT);
                statement.setInt(1,user.getId());
                statement.setString(2,user.getName());
                statement.setString(3,user.getEmail());
                statement.setString(4,user.getCountry());
                statement.executeUpdate();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                }catch (SQLException e){
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }

    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> userList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
              statement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);
            statement.setString(1,country);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                String name = resultSet.getString("user_name");
                String email = resultSet.getString("user_email");
                country = resultSet.getString("user_country");
                userList.add(new User(id, name, email, country));
            }
            System.out.println(userList);
            return userList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> sortByName() {
        List<User> userList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
                statement = connection.prepareStatement(SORT_USER_BY_NAME);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                String name = resultSet.getString("user_name");
                String email = resultSet.getString("user_email");
                String country = resultSet.getString("user_country");
                userList.add(new User(id, name, email, country));
            }
            return userList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
