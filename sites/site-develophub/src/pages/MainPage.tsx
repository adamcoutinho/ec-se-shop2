import {Card} from "../design-system/card";

export default function MainPage() {
    return (
        <div>
            <Card.container width={500} height={300}>
                <Card.cardHeader width={500} height={45}>
                    <div style={{color:"mediumblue", fontStyle:"bold",fontSize:"20px",fontFamily:"monospace"}}>
                        Pipeline
                    </div>
                </Card.cardHeader>
                <Card.cardBody width={500} height={200}>
                    <div>Body</div>
                </Card.cardBody>
                <Card.cardFooter width={500} height={55}>

                     <button>
                         salvar
                     </button>
                    <button>
                        deletar
                    </button>
                </Card.cardFooter>
            </Card.container>
        </div>
    )
}