package com.main.ep.rack.db.postgres.table

import jakarta.persistence.*
import java.time.LocalDate
import java.time.LocalDateTime

@Entity
@Table(name="workspace")
data class WorkspaceTable(
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.IDENTITY)
    val idInternal:Long?=null,
    @field:Column(name="id_external")
    val idExternal:String?=null,
    @field:Column(name="workspace_name")
    val workspaceName:String?=null,
    @field:Column(name="create_at_time")
    val createAtTime:LocalDateTime?= LocalDateTime.now()
)