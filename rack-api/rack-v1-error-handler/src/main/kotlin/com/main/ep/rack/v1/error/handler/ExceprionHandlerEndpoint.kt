package com.main.ep.rack.v1.error.handler

import com.main.ep.rack.v1.error.handler.dto.ErrorResponse
import jakarta.validation.ConstraintViolationException
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RestControllerAdvice


@RestControllerAdvice
class ExceprionHandlerEndpoint {

    @ExceptionHandler(ConstraintViolationException::class)
    fun handler(constraintViolationException: ConstraintViolationException):ResponseEntity<*>{


        val response = ErrorResponse(1,"")

        return ResponseEntity.status(response.status).body(constraintViolationException)
    }

}