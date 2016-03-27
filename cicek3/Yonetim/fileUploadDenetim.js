       var validFilesTypes = ["bmp", "png", "jpg", "jpeg"];
function CheckExtension(file) {
    /*global document: false */
    var filePath = file.value;
    var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
    var isValidFile = false;

    for (var i = 0; i < validFilesTypes.length; i++) {
        if (ext == validFilesTypes[i]) {
            isValidFile = true;
            break;
        }
    }

    if (!isValidFile) {
        file.value = null;
        alert("Bu resim türü desteklenmez. Desteklenen resim türleri:\n\n" + validFilesTypes.join(", "));
    }

    return isValidFile;
}
    var validFileSize = 4 * 1024 * 1024;
function CheckFileSize(file) {
    /*global document: false */
    var fileSize = file.files[0].size;
    var isValidFile = false;
    if (fileSize !== 0 && fileSize <= validFileSize) {
        isValidFile = true;
    }
    else {
        file.value = null;
        alert("Maximimum resim boyutu 4 mb olmalıdır");
    }
    return isValidFile;
}
    function CheckFile(file) {
        var isValidFile = CheckExtension(file);

        if (isValidFile)
            isValidFile = CheckFileSize(file);

        return isValidFile;
    }
