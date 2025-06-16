package com.main.ep.rack.v1.customers.com.main.ep.rack.v1.customers

import com.main.ep.rack.v1.customers.com.main.ep.rack.v1.customers.dto.CustomersFormRequest
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/customers")
class CustomersEndpoint {

    @GetMapping("/test")
    fun test()= ResponseEntity.ok(listOf("1","2","123"))

    @PostMapping
    fun post(@RequestBody request:CustomersFormRequest):ResponseEntity<*> {

        return ResponseEntity.ok(request)
    }


}