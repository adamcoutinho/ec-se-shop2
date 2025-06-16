import styles from './CardHeader.module.css'
type CardHeaderProperties = {
    children: React.ReactNode;
    width?:string | number;
    height?:string | number;

}
export default function CardHeader({ children ,width="200px" ,height="200px"}:CardHeaderProperties) {
    return (
        <div className={styles.cardHeader} style={{width,height}}>
            {children}
        </div>
    )
}