    package com.main.ep.website.server

    import org.springframework.stereotype.Controller
    import org.springframework.web.bind.annotation.RequestMapping

    @Controller
    class HomeController {

        @RequestMapping("/{path:[^\\.]*}")
        fun redirect(): String {
                return "forward:/index.html"
        }

        @RequestMapping(value = ["/develophub", "/develophub/**"],
//            produces = ["text/html"],
            consumes = ["text/html"]
        )
        fun admin(): String {
            return "forward:/static/site-develophub/index.html"
        }
    }
