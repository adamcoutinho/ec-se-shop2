import styles from "./CardBody.module.css"
type CardBodyProperties = {
    children: React.ReactNode;
    width?:string | number;
    height?:string | number;

}
export default function CardBody({ children ,width="200px", height="200px" }: CardBodyProperties) {
    return (
        <div className={styles.cardBody} style={{width,height}}>
            {children}
        </div>
    )
}