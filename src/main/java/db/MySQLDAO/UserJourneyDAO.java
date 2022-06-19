package db.MySQLDAO;

import db.entity.Journey;
import db.entity.User;

import java.util.List;

public interface UserJourneyDAO {
    Integer getOccupiedSeats(Integer journeyId);
    Boolean isUserBoughtTicket(Integer userId, Integer journeyId);
    void removeUserJourney(Integer userId, Integer journeyId);
    Integer createUserJourney(Integer userId, Integer journeyId);
    List<Journey> getAllUserJourneys(Integer userId);
    List<User> getAllUsers(Integer journeyId);
}
