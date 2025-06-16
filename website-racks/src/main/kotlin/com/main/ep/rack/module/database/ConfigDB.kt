package com.main.ep.rack.module.database

import com.main.ep.core.service.db.CustomerDbService
import com.main.ep.rack.db.postgres.jparepository.CustomerJpaRepository
import com.main.ep.rack.db.postgres.repository.CustomerRepositoryImpl
import org.springframework.context.annotation.Bean
import org.springframework.stereotype.Component

@Component
class ConfigDB {

    @Bean
    fun getConfig(customerJpaRepository: CustomerJpaRepository):CustomerDbService{
        return CustomerRepositoryImpl(customerJpaRepository)
    }

}