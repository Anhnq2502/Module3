package service;

import model.User;
import repository.IUserRepository;
import repository.UserRepositoryImpl;

import java.util.List;

public class UserServiceImpl implements IUserService{
    private IUserRepository repository = new UserRepositoryImpl();
    @Override
    public List<User> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(User user) {
        repository.save(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return repository.findByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return repository.sortByName();
    }
}
