package com.main.ep.website.server.filter

import jakarta.servlet.Filter
import jakarta.servlet.FilterChain
import jakarta.servlet.ServletRequest
import jakarta.servlet.ServletResponse
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.core.annotation.Order
import org.springframework.stereotype.Component

@Component
@Order(1)
class SpaRedirectFilter : Filter {

    private val ignoredPaths = listOf(
        "/", ".js", ".css", ".ico", ".png", ".jpg", ".svg", ".json", ".woff", ".ttf"
    )

    override fun doFilter(request: ServletRequest, response: ServletResponse, chain: FilterChain) {
        val req = request as HttpServletRequest
        val path = req.requestURI

        val isApiOrStatic = ignoredPaths.any { path.startsWith(it) || path.contains(it) }

        if (!isApiOrStatic && path != "/" && !path.contains(".")) {
            request.getRequestDispatcher("/index.html").forward(request, response)
        } else {
            chain.doFilter(request, response)
        }
    }
}
