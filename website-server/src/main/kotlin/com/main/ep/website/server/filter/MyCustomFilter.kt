package com.main.ep.website.server.filter

import jakarta.servlet.Filter
import jakarta.servlet.FilterChain
import jakarta.servlet.ServletRequest
import jakarta.servlet.ServletResponse
import jakarta.servlet.ServletException
import java.io.IOException

class MyCustomFilter : Filter {
    @Throws(IOException::class, ServletException::class)
    override fun doFilter(request: ServletRequest, response: ServletResponse, chain: FilterChain) {
        println("Custom filter executed in Spring MVC (Kotlin)")
        chain.doFilter(request, response)
    }
}
