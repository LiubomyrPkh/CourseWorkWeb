package db.MySQLDAOImpl;

import db.DAOFactory;
import db.MySQLDAO.JourneyDAO;
import db.MySQLDAOFactory;
import db.entity.Address;
import db.entity.Journey;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLJourneyDAO implements JourneyDAO {

    enum Queries {
        CREATE_JOURNEY("INSERT INTO journey " +
                "(from_city, to_city, cost, places, bus_number, start_address_id, start_time, end_address_id, end_time)" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"),
        SELECT_JOURNEYS_BY_PARAMS("SELECT * FROM journey as j" +
                " JOIN address as addrStart ON addrStart.address_id = j.start_address_id" +
                " JOIN address as addrEnd ON addrEnd.address_id = j.end_address_id WHERE"),
        SELECT_ALL_JOURNEYS("SELECT * FROM journey"),
        GET_JOURNEY_BY_ID("SELECT * FROM journey WHERE journey_id = ?");

        private final String query;

        Queries(String query) {
            this.query = query;
        }
    }

    @Override
    public void createJourney(Journey journey) {
        int insertedId = 0;
        try (Connection connection = MySQLDAOFactory.createConnection();
             PreparedStatement statement = connection.prepareStatement(Queries.CREATE_JOURNEY.query,
                     Statement.RETURN_GENERATED_KEYS)) {

            statement.setString(1, journey.getFrom_city());
            statement.setString(2, journey.getTo_city());
            statement.setDouble(3, journey.getCost());
            statement.setInt(4, journey.getPlaces());
            statement.setString(5, journey.getBus_number());
            statement.setInt(6, journey.getStart_address_id().getAddress_id());
            statement.setString(7, journey.getStart_time());
            statement.setInt(8, journey.getEnd_address_id().getAddress_id());
            statement.setString(9, journey.getEnd_time());

            int rowsAffected = statement.executeUpdate();

            insertedId = MySQLCRUDUtils.idAfterInsert(statement, rowsAffected);

            journey.setJourney_id(insertedId);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public List<Journey> getAllJourneys(Journey criteria) {
        ArrayList<Journey> list = new ArrayList<>();

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(queryCriteriaFill(criteria))) {

            int paramIndex = 1;

            if (criteria != null) {
                if(criteria.getFrom_city() != null) {
                    statement.setString(paramIndex++, criteria.getFrom_city());
                }

                if(criteria.getTo_city() != null) {
                    statement.setString(paramIndex++, criteria.getTo_city());
                }

                if(criteria.getCost() != null) {
                    statement.setDouble(paramIndex++, criteria.getCost());
                }

                if(criteria.getPlaces() != null) {
                    statement.setInt(paramIndex++, criteria.getPlaces());
                }

                if(criteria.getBus_number() != null) {
                    statement.setString(paramIndex++, criteria.getBus_number());
                }

                if(criteria.getStart_address_id() != null) {
                    statement.setInt(paramIndex++, criteria.getStart_address_id().getAddress_id());
                }

                if(criteria.getStart_time() != null) {
                    statement.setString(paramIndex++, criteria.getStart_time());
                }

                if(criteria.getEnd_address_id() != null) {
                    statement.setInt(paramIndex++, criteria.getEnd_address_id().getAddress_id());
                }

                if(criteria.getEnd_time() != null) {
                    statement.setString(paramIndex, criteria.getEnd_time());
                }
            }

            ResultSet res = statement.executeQuery();

            while(res.next()) {
                Address startAddress = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().getAddressById(res.getInt("start_address_id"));
                Address endAddress = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().getAddressById(res.getInt("end_address_id"));
                list.add(MySQLCRUDUtils.fillJourney(res, startAddress, endAddress));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    @Override
    public Journey getJourneyById(Integer id) {
        Journey journey = null;

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.GET_JOURNEY_BY_ID.query)) {

            statement.setInt(1, id);
            ResultSet res = statement.executeQuery();

            if(res.next()) {
                Address startAddress = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().getAddressById(res.getInt("start_address_id"));
                Address endAddress = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().getAddressById(res.getInt("end_address_id"));
                journey = MySQLCRUDUtils.fillJourney(res, startAddress, endAddress);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return journey;
    }

    private String queryCriteriaFill(Journey criteria) {
        StringBuilder query = new StringBuilder(Queries.SELECT_JOURNEYS_BY_PARAMS.query);

        if(criteria == null ||
                        (criteria.getFrom_city() == null &&
                        criteria.getTo_city() == null &&
                        criteria.getCost() == null &&
                        criteria.getPlaces() == null &&
                        criteria.getBus_number() == null &&
                        criteria.getStart_address_id() == null &&
                        criteria.getStart_time() == null &&
                        criteria.getEnd_address_id() == null &&
                        criteria.getEnd_time() == null)) {
            return Queries.SELECT_ALL_JOURNEYS.query;
        }

        if(criteria.getFrom_city() != null) {
            query.append(" from_city = ?").append(" AND");
        }

        if(criteria.getTo_city() != null) {
            query.append(" to_city = ?").append(" AND");
        }

        if(criteria.getCost() != null) {
            query.append(" cost = ?").append(" AND");
        }

        if(criteria.getPlaces() != null) {
            query.append(" places = ?").append(" AND");
        }

        if(criteria.getBus_number() != null) {
            query.append(" bus_number = ?").append(" AND");
        }

        if(criteria.getStart_address_id() != null) {
            query.append(" start_address_id = ?").append(" AND");
        }

        if(criteria.getStart_time() != null) {
            query.append(" start_time = ?").append(" AND");
        }

        if(criteria.getEnd_address_id() != null) {
            query.append(" end_address_id = ?").append(" AND");
        }

        if(criteria.getEnd_time() != null) {
            query.append(" end_time = ?").append(" AND");
        }

        return MySQLCRUDUtils.removeLastAndInQuery(query.toString());
    }
}
