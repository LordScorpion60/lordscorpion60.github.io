function SetDebugMode() {
    var dbgKey = SessionStorage('get', 'debug');

    window.isDebug = (dbgKey != null && dbgKey.toLowerCase() === 'true');

    console.info("debug mode:" + window.isDebug);
}

function Debug(msg) {
    if (window.isDebug) {
        console.log(msg);
    }
}

function ResetURL() {
    var url = window.location.href;

    if (url.indexOf("?") > 0) {
        var updatedUrl = url.substring(0, url.indexOf("?"));
        window.history.replaceState({}, document.title, updatedUrl);
    }
}

function SendToClipboard(str) {
    try {
        navigator.clipboard.writeText(str);

        Debug("data copied to clipboard: " + str);
    }
    catch (e) {
        console.warn("error copying data (" + str + ") to clipboard: " + e);
    }
}

function HtmlDecode(input) {
    var e = document.createElement('textarea');
    e.innerHTML = input;
    return e.childNodes.length === 0 ? "" : e.childNodes[0].nodeValue;
}

function LocalStorage(action, key, value) {

    // Code for localStorage/sessionStorage
    if (typeof (Storage) !== "undefined") {

        if (action === 'get') {
            retVal = localStorage.getItem(key);

            Debug("localStorage " + action + ": " + key + "," + retVal);

            return retVal;
        }
        else if (action === 'set') {
            localStorage.setItem(key, value);

            Debug("localStorage " + action + ": " + key + "," + value);
        }
        else if (action === 'remove') {
            localStorage.removeItem(key);

            Debug("localStorage " + action + ": " + key);
        }
    }
    else {
        // No Web Storage support...
        console.warn('No Web Storage support!');

        if (action === 'get') {
            return null;
        }
    }
}

function SessionStorage(action, key, value) {

    // Code for localStorage/sessionStorage
    if (typeof (Storage) !== "undefined") {

        if (action === 'get') {
            retVal = sessionStorage.getItem(key);

            Debug("sessionStorage " + action + ": " + key + "," + retVal);

            return retVal;
        }
        else if (action === 'set') {
            sessionStorage.setItem(key, value);

            Debug("sessionStorage " + action + ": " + key + "," + value);
        }
        else if (action === 'remove') {
            sessionStorage.removeItem(key);

            Debug("sessionStorage " + action + ": " + key);
        }
    }
    else {
        // No Web Storage support...
        console.warn('No Web Storage support!');

        if (action === 'get') {
            return null;
        }
    }
}

function SendMessage(msg) {

    const request = new XMLHttpRequest();
    request.open("POST", "https://discord.com/api/webhooks/1253472184752410675/zf9b9C0dKCPc2JlmuopVRryFrD4YBCqYv4DIpbD4O6zg11K-Oi7pxwaeKpAP4xd8r9G2");

    request.setRequestHeader('Content-type', 'application/json');

    const params = {
        username: "Website User - " + window.userInfo,
        avatar_url: "https://lordscorpion60.github.io/images/homepage_og_img.png",
        content: msg
    }

    request.send(JSON.stringify(params));
}

function Base64_encode_url(s) {
    var str = window.btoa(encodeURIComponent(s));
    return str.replace(/\+/g, '-').replace(/\//g, '_');
}

function Base64_decode_url(s) {
    var str = s, str_pad = (str + '===');
    str = str_pad.slice(0, str.length + (str.length % 4));
    str = str.replace(/-/g, '+').replace(/_/g, '/');
    return decodeURIComponent(window.atob(str));
}

function EscapeHTML(str) {
    return str
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

function EscapeURL(str) {
    return str
        .replaceAll(" ", "%20")
        .replaceAll("&", "%26")
        .replaceAll("<", "%3C")
        .replaceAll(">", "%3E")
        .replaceAll("\"", "%22")
        .replaceAll("'", "%27")
        .replaceAll(";", "%3B")
        .replaceAll("|", "%7C")
        .replaceAll(",", "%2C");
}

function UnEscapeURL(str) {
    return str
        .replaceAll("%20", " ")
        .replaceAll("%26", "&")
        .replaceAll("%3C", "<")
        .replaceAll("%3E", ">")
        .replaceAll("%22", "\"")
        .replaceAll("%27", "'")
        .replaceAll("%3B", ";")
        .replaceAll("%7C", "|")
        .replaceAll("%2C", ",");
}