package com.main.ep.website.server.interceptor

import org.springframework.web.servlet.HandlerInterceptor
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.stereotype.Component

@Component
class MyCustomInterceptor : HandlerInterceptor {

    override fun preHandle(
        request: HttpServletRequest,
        response: HttpServletResponse,
        handler: Any
    ): Boolean {
        println("Interceptor preHandle: Request URI = ${request.requestURI}")
        return true // continue to the controller
    }
}
