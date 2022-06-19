package db.entity;

public class Address {
    private Integer address_id;
    private String street;
    private Integer house_num;

    public Address() {}

    public Address(String street, Integer house_num) {
        this.street = street;
        this.house_num = house_num;
    }

    public Address(Integer address_id, String street, Integer house_num) {
        this.address_id = address_id;
        this.street = street;
        this.house_num = house_num;
    }

    public Address(String[] arr) {
        this.street = arr[0];
        this.house_num = Integer.valueOf(arr[1]);
    }

    public Integer getAddress_id() {
        return address_id;
    }

    public void setAddress_id(Integer address_id) {
        this.address_id = address_id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public Integer getHouse_num() {
        return house_num;
    }

    public void setHouse_num(Integer house_num) {
        this.house_num = house_num;
    }
}
