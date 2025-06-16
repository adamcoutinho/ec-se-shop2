package com.main.ep.rack.db.postgres.jparepository

import com.main.ep.rack.db.postgres.table.CustomerTable
import org.springframework.data.jpa.repository.JpaRepository

interface CustomerJpaRepository :JpaRepository<CustomerTable,Long>