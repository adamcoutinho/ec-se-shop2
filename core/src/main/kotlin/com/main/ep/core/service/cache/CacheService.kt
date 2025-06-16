package com.main.ep.core.service.cache

interface CacheService {
    fun get(key:String):Any?
    fun put(key:String, any:Any)
    fun put(key:String, any:Any,ttl:String)
    fun remove(key:String)
}