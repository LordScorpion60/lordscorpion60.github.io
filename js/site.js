function SetDebugMode() {
    var dbgKey = SessionStorage('get', 'debug');

    window.isDebug = (dbgKey != null && dbgKey.toLowerCase() === 'true');

    console.info("debug mode:" + window.isDebug);
}

function Debug(msg, callerOverride) {
    if (window.isDebug) {
        var caller = arguments.callee.caller.name;

        if (callerOverride != null && callerOverride.length > 0) {
            caller = callerOverride;
        }

        console.log("[" + caller + "] " + msg);
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

            Debug(action + ": " + key + "," + retVal);

            return retVal;
        }
        else if (action === 'set') {
            localStorage.setItem(key, value);

            Debug(action + ": " + key + "," + value);
        }
        else if (action === 'remove') {
            localStorage.removeItem(key);

            Debug(action + ": " + key);
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

            Debug(action + ": " + key + "," + retVal);

            return retVal;
        }
        else if (action === 'set') {
            sessionStorage.setItem(key, value);

            Debug(action + ": " + key + "," + value);
        }
        else if (action === 'remove') {
            sessionStorage.removeItem(key);

            Debug(action + ": " + key);
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
    request.open("POST", "https://discord.com/api/webhooks/1349802165924925440/SLrme92uLrQ7jSO-YwFw8A_LmOL3TcM45zBty_QNRBw6_rnSnZTvFmK_Z1i_WmXujmgr");

    request.setRequestHeader('Content-type', 'application/json');

    const params = {
        username: "Website User - " + window.userInfo,
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