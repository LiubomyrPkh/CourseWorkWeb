package db.entity;

public class User {
    private Integer user_id;
    private String first_name;
    private String last_name;
    private String email;
    private String password;
    private Role role;

    public enum Role {
        USER("user"),
        ADMIN("admin"),;

        private final String role;

        private Role(String role) {
            this.role = role;
        }

        public String getRole() {
            return role;
        }
    }

    public User() {}

    public User(String first_name, String last_name, String email,
                String password, Role role) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public User(Integer user_id, String first_name, String last_name,
                String email, String password, Role role) {
        this.user_id = user_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
