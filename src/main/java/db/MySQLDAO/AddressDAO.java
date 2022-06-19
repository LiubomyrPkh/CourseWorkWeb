package db.MySQLDAO;

import db.entity.Address;

public interface AddressDAO {
    Address getAddressById(Integer id);
    void createAddress(Address address);
    Address getAddressByStreetAndHouseNumber(String street, Integer houseNumber);
}
