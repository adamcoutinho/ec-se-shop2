import * as React from "react";
import styles from "./DashboardMenu.module.css"
type DashboardMenuProperties = {
    children?: React.ReactNode,
    width?: string | number;
    height?: string | number;
}
export default function DashboardMenu({children,width="100px",height="100vh"}:DashboardMenuProperties) {
    return (
        <div className={styles.dashboardMenu} style={{width,height}}>
            {children}
        </div>
    )
}