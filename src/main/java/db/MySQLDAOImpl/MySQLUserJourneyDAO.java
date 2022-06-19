package db.MySQLDAOImpl;

import db.DAOFactory;
import db.MySQLDAO.UserJourneyDAO;
import db.MySQLDAOFactory;
import db.entity.Address;
import db.entity.Journey;
import db.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLUserJourneyDAO implements UserJourneyDAO {

    enum Queries {
        GET_OCCUPIED_SEATS("SELECT count(*) as total FROM user_journey WHERE journey_id = ?"),
        IS_USER_BOUGHT_TICKET("SELECT * FROM user_journey WHERE journey_id = ? AND user_id = ?"),
        DELETE_USER_JOURNEY_BY_USER_ID_AND_JOURNEY_ID("DELETE FROM user_journey WHERE user_id = ? AND journey_id = ?"),
        CREATE_USER_JOURNEY("INSERT INTO user_journey (user_id, journey_id) VALUES (?, ?)"),
        GET_ALL_USER_JOURNEYS("SELECT * FROM user_journey as uj JOIN journey as j ON j.journey_id = uj.journey_id WHERE user_id = ?"),
        GET_ALL_USERS("SELECT * FROM user_journey as uj JOIN user as u ON u.user_id = uj.user_id WHERE journey_id = ?");

        private final String query;

        Queries(String query) {
            this.query = query;
        }
    }

    @Override
    public Integer getOccupiedSeats(Integer journeyId) {
        Integer count = null;

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.GET_OCCUPIED_SEATS.query)) {

            statement.setInt(1, journeyId);
            ResultSet res = statement.executeQuery();

            if(res.next()) {
                count = res.getInt("total");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return count;
    }

    @Override
    public Boolean isUserBoughtTicket(Integer userId, Integer journeyId) {
        boolean result = false;

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.IS_USER_BOUGHT_TICKET.query)) {

            statement.setInt(1, journeyId);
            statement.setInt(2, userId);
            ResultSet res = statement.executeQuery();

            if(res.next()) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return result;
    }

    @Override
    public void removeUserJourney(Integer userId, Integer journeyId) {
        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.DELETE_USER_JOURNEY_BY_USER_ID_AND_JOURNEY_ID.query)) {
            statement.setInt(1, userId);
            statement.setInt(2, journeyId);
            statement.executeUpdate();
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public Integer createUserJourney(Integer userId, Integer journeyId) {
        int insertedId = 0;
        try (Connection connection = MySQLDAOFactory.createConnection();
             PreparedStatement statement = connection.prepareStatement(Queries.CREATE_USER_JOURNEY.query,
                     Statement.RETURN_GENERATED_KEYS)) {

            statement.setInt(1, userId);
            statement.setInt(2, journeyId);

            int rowsAffected = statement.executeUpdate();

            insertedId = MySQLCRUDUtils.idAfterInsert(statement, rowsAffected);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return insertedId;
    }

    @Override
    public List<Journey> getAllUserJourneys(Integer userId) {
        List<Journey> journeyList = null;

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.GET_ALL_USER_JOURNEYS.query)) {

            statement.setInt(1, userId);
            ResultSet res = statement.executeQuery();
            journeyList = new ArrayList<>();

            while(res.next()) {
                Address startAddress = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().getAddressById(res.getInt("start_address_id"));
                Address endAddress = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().getAddressById(res.getInt("end_address_id"));
                journeyList.add(MySQLCRUDUtils.fillJourney(res, startAddress, endAddress));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return journeyList;
    }

    @Override
    public List<User> getAllUsers(Integer journeyId) {
        List<User> userList = null;

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.GET_ALL_USERS.query)) {

            statement.setInt(1, journeyId);
            ResultSet res = statement.executeQuery();
            userList = new ArrayList<>();

            while(res.next()) {
                userList.add(MySQLCRUDUtils.fillUser(res));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return userList;
    }


}
