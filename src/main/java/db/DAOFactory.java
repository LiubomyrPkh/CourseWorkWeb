package db;

import db.MySQLDAO.*;

public abstract class DAOFactory {

    public enum DBTypes {
        MySQL
    }

    public abstract JourneyDAO getJourneyDAO();
    public abstract AddressDAO getAddressDAO();
    public abstract UserDAO getUserDAO();
    public abstract UserJourneyDAO getUserJourneyDAO();

    public static DAOFactory getDAOFactory(DBTypes whichFactory) {

        switch (whichFactory) {
            case MySQL: return MySQLDAOFactory.getInstance();
            default: return MySQLDAOFactory.getInstance();
        }

    }
}
