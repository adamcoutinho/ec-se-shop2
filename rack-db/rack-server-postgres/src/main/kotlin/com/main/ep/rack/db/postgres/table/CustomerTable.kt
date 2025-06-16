package com.main.ep.rack.db.postgres.table

import jakarta.persistence.*

@Entity
@Table(name="customer")
class CustomerTable(
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.IDENTITY)
    val idInternal:Long?=null,
    @Column(name="user_name")
    val userName:String?=null,
    @Column(name="password")
    val password:String?=null
)