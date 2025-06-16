// main.jsx or index.jsx
import {createBrowserRouter,} from "react-router-dom";
import HomePage from "../pages/HomePage.tsx";
import MainPage from "../pages/MainPage.tsx";
import SigninPage from "../pages/SigninPage.tsx";


export const router = createBrowserRouter([
    {
        path: "develophub/home",
        element: <HomePage/>,
    },
    {
        path: "develophub/",
        element: <SigninPage/>,
    },
    {
        path: "develophub/main",
        element: <MainPage/>,
    },
]);