package com.agritrust.user.controller;

import com.agritrust.user.entity.User;
import com.agritrust.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Controller
@RequestMapping("/user") // Base path for GraphQL requests

public class UserController {
    @Autowired
    private UserService userService;

    @QueryMapping
    public Flux<User> users() {
        return userService.getAllUsers();
    }

    @QueryMapping
    public Mono<User> userById(@Argument String user_id) {
        return userService.getUserById(user_id);
    }

    @MutationMapping
    public Mono<User> createUser(@Argument String name, @Argument String role, 
                                @Argument String mobile, @Argument String language, 
                                @Argument String district) {
        User user = new User();
        user.setName(name);
        user.setRole(role);
        user.setMobile(mobile);
        user.setLanguage(language);
        user.setDistrict(district);
        return userService.createUser(user);
    }

    @MutationMapping
    public Mono<Void> deleteUser(@Argument String user_id) {
        return userService.deleteUser(user_id);
    }
} 