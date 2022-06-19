package db.MySQLDAOImpl;

import db.MySQLDAO.UserDAO;
import db.MySQLDAOFactory;
import db.entity.User;

import java.sql.*;

public class MySQLUserDAO implements UserDAO {

    enum Queries {
        INSERT_USER("INSERT INTO user (first_name, last_name, email, password, role) VALUES (?, ?, ?, ?, ?)"),
        GET_USER_BY_EMAIL("SELECT * FROM user WHERE email = ?"),
        UPDATE_USER("UPDATE user SET first_name = ?, last_name = ?, email = ?, password = ?, role = ? WHERE user_id = ?");

        private final String query;

        Queries(String query) {
            this.query = query;
        }
    }

    @Override
    public void createUser(User user) {
        int insertedId = 0;
        try (Connection connection = MySQLDAOFactory.createConnection();
             PreparedStatement statement = connection.prepareStatement(Queries.INSERT_USER.query,
                     Statement.RETURN_GENERATED_KEYS)) {

            statement.setString(1, user.getFirst_name());
            statement.setString(2, user.getLast_name());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getRole().toString());

            int rowsAffected = statement.executeUpdate();

            insertedId = MySQLCRUDUtils.idAfterInsert(statement, rowsAffected);

            user.setUser_id(insertedId);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public User getUserByEmail(String email) {
        User user = null;

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.GET_USER_BY_EMAIL.query)) {

            statement.setString(1, email);
            ResultSet res = statement.executeQuery();

            if(res.next()) {
                user = MySQLCRUDUtils.fillUser(res);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean updateUser(User user) {
        boolean res = false;

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.UPDATE_USER.query)) {

            statement.setString(1, user.getFirst_name());
            statement.setString(2, user.getLast_name());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getRole().toString());
            statement.setInt(6, user.getUser_id());

            res = statement.executeUpdate() > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return res;
    }


}
