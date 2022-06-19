package db.MySQLDAO;

import db.entity.Journey;

import java.util.List;

public interface JourneyDAO {
    void createJourney(Journey journey);
    List<Journey> getAllJourneys(Journey criteria);
    Journey getJourneyById(Integer id);
}
