import css from "/src/css/main.css?inline";
import { Elm } from "/src/Main.elm";

const styles = document.createElement("style");
styles.innerHTML = css;

document.head.prepend(styles);

const app = Elm.Main.init({});
