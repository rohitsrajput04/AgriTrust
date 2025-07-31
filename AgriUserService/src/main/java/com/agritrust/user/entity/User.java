package com.agritrust.user.entity;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document(collection = "AgriUserDetails")
public class User {
    @Id
    private String user_id;
    private String name;
    private String role;
    private String mobile;
    private String language;
    private String district;
} 