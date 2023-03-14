package repository;

import model.User;

import java.util.List;

public interface IUserRepository {

    List<User> findAll();

    void save(User user);
    List<User> findByCountry(String country);
    List<User> sortByName();
}
