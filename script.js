const setUpCopy = () => {
    const el = document.getElementById("copy");
    el.addEventListener("click", () => {
        navigator.clipboard.writeText(el.innerText);
    });
}
const init = () => {
    setUpCopy();
}
init();