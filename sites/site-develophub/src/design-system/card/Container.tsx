import styles from "./Container.module.css";

type ContainerProperties = {
    children: React.ReactNode
    width?: string | number;
    height?: string | number;
}
export default function Container({children,width="200px",height="200px"}:ContainerProperties) {
    return (
      <div className={styles.container} style={{width,height}}>
          {children}
      </div>
    )
}