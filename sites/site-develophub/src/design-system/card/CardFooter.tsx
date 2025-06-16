import styles from './CardFooter.module.css';

type CardFooterProperties = {
    children: React.ReactNode;
    width?:string | number;
    height?:string | number;
}
export default function CardFooter({ children, width="200px", height="200px" }: CardFooterProperties) {
    return (
        <div className={styles.cardFooter} style={{width,height}}>
            {children}
        </div>
    )
}