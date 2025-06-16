import * as React from "react";
import styles from "./DashboardView.module.css";

type DashboardViewProperties = {
    children?: React.ReactNode
}

export default function DashboardView({children}:DashboardViewProperties) {
    return (
        <div className={styles.dashboardView}>
            {children}
        </div>
    )
}