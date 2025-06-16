import  styles from "./DashboardLayout.module.css"
export default function DashboardLayout({ children }: { children: React.ReactNode }) {
  return (
    <main className={styles.layout}>
        {children}
    </main>
  )
}