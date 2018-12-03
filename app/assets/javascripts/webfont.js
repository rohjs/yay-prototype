(function () {
  "use strict";
  var cssHref = '/css/webfont.encoded.css';
  // localStorage 를 지원하지 않는 브라우저를 위한 css
  var cssHrefNormal = '/css/webfont.css';

  function on(el, ev, callback) {
      if (el.addEventListener) {
          el.addEventListener(ev, callback, false);
      } else if (el.attachEvent) {
          el.attachEvent("on" + ev, callback);
      }
  }

  if (
    (window.localStorage && localStorage.font_css_cache)
    || document.cookie.indexOf('font_css_cache') > -1
  ) injectFontsStylesheet();
  else on(window, "load", injectFontsStylesheet);

  function isFileCached(href) {
    return (
      window.localStorage
      && localStorage.font_css_cache
      && (localStorage.font_css_cache_file === href)
    );
  }

  function isOldBrowser(){
    return (
      !window.localStorage
      || !window.XMLHttpRequest
      || (document.getElementsByTagName('html')[0].className.indexOf('oldie') > -1)
    );
  }

  function injectFontsStylesheet() {
    if (isOldBrowser()) {
      var stylesheet = document.createElement('link');
      stylesheet.href = cssHrefNormal;
      stylesheet.rel = 'stylesheet';
      stylesheet.type = 'text/css';
      document.getElementsByTagName('head')[0].appendChild(stylesheet);
      document.cookie = "font_css_cache";
    } else {
      if (isFileCached(cssHref)) {
        injectRawStyle(localStorage.font_css_cache);
      } else {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", cssHref, true);

        xhr.onreadystatechange = function () {
          if (xhr.readyState === 4) {
            injectRawStyle(xhr.responseText);
            localStorage.font_css_cache = xhr.responseText;
            localStorage.font_css_cache_file = cssHref;
          }
        };

        xhr.send();
      }
    }
  }

  function injectRawStyle(text) {
    var style = document.createElement('style');
    // style.innerHTML 을 지원하지 않는 IE8을 위한 조치
    style.setAttribute("type", "text/css");
    if (style.styleSheet) {
      style.styleSheet.cssText = text;
    } else {
      style.innerHTML = text;
    }
    document.getElementsByTagName('head')[0].appendChild(style);
  }

}());