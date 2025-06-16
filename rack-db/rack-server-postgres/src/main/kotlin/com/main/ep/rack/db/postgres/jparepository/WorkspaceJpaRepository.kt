package com.main.ep.rack.db.postgres.jparepository

import com.main.ep.rack.db.postgres.table.WorkspaceTable
import org.springframework.data.jpa.repository.JpaRepository

interface WorkspaceJpaRepository:JpaRepository<WorkspaceTable,Long> {
}