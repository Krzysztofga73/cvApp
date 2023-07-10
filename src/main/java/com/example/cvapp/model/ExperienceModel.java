package com.example.cvapp.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class ExperienceModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name ="title")
    private String title;
    @Column(name ="subtitle")
    private String subtitle;
    @Column(name ="description")
    private String description;
    @Column(name = "dateFrom")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateFrom;
    @Column(name = "dateTo")
    @DateTimeFormat (pattern = "yyyy-MM-dd")
    private Date dateTo;
}
