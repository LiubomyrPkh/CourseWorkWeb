package db.entity;

public class Journey {
    private Integer journey_id;
    private String from_city;
    private String to_city;
    private Double cost;
    private Integer places;
    private String bus_number;
    private Address start_address_id;
    private String start_time;
    private Address end_address_id;
    private String end_time;

    public Journey() {}

    public Journey(String from_city, String to_city, Double cost,
                   Integer places, String bus_number, Address start_address_id,
                   String start_time, Address end_address_id, String end_time) {
        this.from_city = from_city;
        this.to_city = to_city;
        this.cost = cost;
        this.places = places;
        this.bus_number = bus_number;
        this.start_address_id = start_address_id;
        this.start_time = start_time;
        this.end_address_id = end_address_id;
        this.end_time = end_time;
    }

    public Journey(Integer journey_id, String from_city, String to_city,
                   Double cost, Integer places, String bus_number,
                   Address start_address_id, String start_time,
                   Address end_address_id, String end_time) {
        this.journey_id = journey_id;
        this.from_city = from_city;
        this.to_city = to_city;
        this.cost = cost;
        this.places = places;
        this.bus_number = bus_number;
        this.start_address_id = start_address_id;
        this.start_time = start_time;
        this.end_address_id = end_address_id;
        this.end_time = end_time;
    }

    public Integer getJourney_id() {
        return journey_id;
    }

    public void setJourney_id(Integer journey_id) {
        this.journey_id = journey_id;
    }

    public String getFrom_city() {
        return from_city;
    }

    public void setFrom_city(String from_city) {
        this.from_city = from_city;
    }

    public String getTo_city() {
        return to_city;
    }

    public void setTo_city(String to_city) {
        this.to_city = to_city;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public Integer getPlaces() {
        return places;
    }

    public void setPlaces(Integer places) {
        this.places = places;
    }

    public String getBus_number() {
        return bus_number;
    }

    public void setBus_number(String bus_number) {
        this.bus_number = bus_number;
    }

    public Address getStart_address_id() {
        return start_address_id;
    }

    public void setStart_address_id(Address start_address_id) {
        this.start_address_id = start_address_id;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public Address getEnd_address_id() {
        return end_address_id;
    }

    public void setEnd_address_id(Address end_address_id) {
        this.end_address_id = end_address_id;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }
}
