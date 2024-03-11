function decodeEntities(encodedString) {
    let textArea = document.createElement('textarea');
    textArea.innerHTML = encodedString;
    return textArea.value;
}