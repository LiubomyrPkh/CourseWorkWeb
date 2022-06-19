package db.MySQLDAOImpl;

import db.entity.Address;
import db.entity.Journey;
import db.entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLCRUDUtils {
    public static int idAfterInsert(Statement state, int rowsAffected) throws SQLException {
        int insertedId = 0;
        if(rowsAffected == 0) {
            throw new SQLException("Creating failed, no rows affected.");
        }

        try (ResultSet generatedKeys = state.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                insertedId = generatedKeys.getInt(1);
            }
            else {
                throw new SQLException("Creating failed, no ID obtained.");
            }
        }

        return insertedId;
    }

    public static Address fillAddress(ResultSet res) throws SQLException {
        return new Address(
                res.getInt("address_id"),
                res.getString("street"),
                res.getInt("house_num")
        );
    }

    public static Journey fillJourney(ResultSet res, Address start, Address end) throws SQLException {
        return new Journey(
                res.getInt("journey_id"),
                res.getString("from_city"),
                res.getString("to_city"),
                res.getDouble("cost"),
                res.getInt("places"),
                res.getString("bus_number"),
                start,
                res.getString("start_time"),
                end,
                res.getString("end_time")
        );
    }

    public static User fillUser(ResultSet res) throws SQLException {
        return new User(
                res.getInt("user_id"),
                res.getString("first_name"),
                res.getString("last_name"),
                res.getString("email"),
                res.getString("password"),
                User.Role.valueOf(res.getString("role"))
        );
    }

    public static String removeLastAndInQuery(String query) {
        String[] stringArr = query.split(" ");

        if(stringArr[stringArr.length - 1].equals("AND")) {
            stringArr[stringArr.length - 1] = "";
        }

        return String.join(" ", stringArr);
    }
}
