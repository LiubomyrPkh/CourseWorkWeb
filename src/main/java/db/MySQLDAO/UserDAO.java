package db.MySQLDAO;

import db.entity.User;

import java.util.Optional;

public interface UserDAO {
    void createUser(User user);
    User getUserByEmail(String email);
    boolean updateUser(User user);
}
