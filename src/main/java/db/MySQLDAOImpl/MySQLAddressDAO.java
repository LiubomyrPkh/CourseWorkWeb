package db.MySQLDAOImpl;

import db.MySQLDAO.AddressDAO;
import db.MySQLDAOFactory;
import db.entity.Address;
import db.entity.User;

import java.sql.*;

public class MySQLAddressDAO implements AddressDAO {

    enum Queries {
        CREATE_ADDRESS("INSERT INTO address (street, house_num) VALUES(?, ?)"),
        GET_ADDRESS_BY_ID("SELECT * FROM address WHERE address_id = ?"),
        DET_ADDRESS_BY_STREET_AND_HOUSE_NUMBER("SELECT * FROM address WHERE street = ? AND house_num = ?");

        private final String query;

        Queries(String query) {
            this.query = query;
        }
    }

    @Override
    public Address getAddressById(Integer id) {
        Address address = null;

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.GET_ADDRESS_BY_ID.query)) {

            statement.setInt(1, id);
            ResultSet res = statement.executeQuery();

            if(res.next()) {
                address = MySQLCRUDUtils.fillAddress(res);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return address;
    }

    @Override
    public void createAddress(Address address) {
        int insertedId = 0;
        try (Connection connection = MySQLDAOFactory.createConnection();
             PreparedStatement statement = connection.prepareStatement(Queries.CREATE_ADDRESS.query,
                     Statement.RETURN_GENERATED_KEYS)) {

            statement.setString(1, address.getStreet());
            statement.setInt(2, address.getHouse_num());

            int rowsAffected = statement.executeUpdate();

            insertedId = MySQLCRUDUtils.idAfterInsert(statement, rowsAffected);

            address.setAddress_id(insertedId);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public Address getAddressByStreetAndHouseNumber(String street, Integer houseNumber) {
        Address address = null;

        try(Connection connection = MySQLDAOFactory.createConnection();
            PreparedStatement statement = connection.prepareStatement(Queries.DET_ADDRESS_BY_STREET_AND_HOUSE_NUMBER.query)) {

            statement.setString(1, street);
            statement.setInt(2, houseNumber);
            ResultSet res = statement.executeQuery();

            if(res.next()) {
                address = MySQLCRUDUtils.fillAddress(res);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return address;
    }

}
