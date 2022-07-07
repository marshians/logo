const select = (color) => {
  document.querySelector("#zip-file").href = `/dist/${color}/${color}.zip`;
  document.querySelector("#size-400").href = `/dist/${color}/${color}-400.png`;
  document.querySelector("#size-600").href = `/dist/${color}/${color}-600.png`;
  document.querySelector("#size-800").href = `/dist/${color}/${color}-800.png`;
  document.querySelector("#size-2k").href = `/dist/${color}/${color}-background-2k.png`;
  document.querySelector("#size-3k").href = `/dist/${color}/${color}-background-3k.png`;
  document.querySelector("#size-4k").href = `/dist/${color}/${color}-background-4k.png`;
  document.querySelector("#downloadModalLabel").innerHTML = color;
};
const load = () => {
  fetch("/colors.json")
    .then(response => response.json())
    .then(data => {
      var container = document.querySelector("#cards");
      data.forEach((color) => {
        // Clone and append for the non-text version
        var clone = document.querySelector("#card").content.cloneNode(true);
        var img = clone.querySelector("img");
        img.src = `/dist/marshians-${color.name}/images/safari-pinned-tab.svg`;
        img.onclick = () => select(`marshians-${color.name}`);
        container.appendChild(clone);

        // Do the text version as well.
        var clone = document.querySelector("#card").content.cloneNode(true);
        var img = clone.querySelector("img");
        img.src = `/dist/marshians-text-${color.name}/images/safari-pinned-tab.svg`;
        img.onclick = () => select(`marshians-text-${color.name}`);
        container.appendChild(clone);
      });
    });
};

window.onload = load
