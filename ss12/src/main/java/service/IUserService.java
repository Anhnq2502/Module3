package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();

    void save(User user);
    List<User> findByCountry(String country);
    List<User> sortByName();
}
