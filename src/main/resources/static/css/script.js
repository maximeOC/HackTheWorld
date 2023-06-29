function downloadPdf() {
    document.getElementById("downloadPdfButton").style.display = "none";
    window.print();
    document.getElementById("downloadPdfButton").style.display = "block";
}