import * as React from "react";
import styles from "./DashboardWrapper.module.css";

type DashboardWrapperProperties = {
    children?: React.ReactNode
}

export default function DashboardWrapper({children}:DashboardWrapperProperties) {
    return (
        <div className={styles.dashboardWrapper}>
            {children}
        </div>
    )
}