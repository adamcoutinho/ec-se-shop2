import {Dashboard} from "../layout/dashboard";

export default function HomePage() {
    return (
        <Dashboard.dashboardLayout>
            <Dashboard.dashboardView>
            <Dashboard.dashboardMenu width={150}>
                   <div style={{color:"red", fontStyle:"bold",fontSize:"20px",fontFamily:"monospace"}}> 
                       Polyphia
                   </div>
            </Dashboard.dashboardMenu>
              <Dashboard.wrapper>
                  <div style={{
                      width:"100%",
                      height:"80px",
                      borderStyle:"solid",borderColor:"red",margin:"1px" ,padding:"1px"}}>
                      Header
                  </div>
              </Dashboard.wrapper>
            </Dashboard.dashboardView>
        </Dashboard.dashboardLayout>
    )
}