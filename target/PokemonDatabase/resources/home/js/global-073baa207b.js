SV=window.SV||{},SV.HoverIntent=function(e,t){const n={exitDelay:400,interval:100,sensitivity:7};let o,r,l,i,s,a,c,u={};const f=function(e){o=e.pageX,r=e.pageY},d=function(e){const t=l-o,n=i-r;if(Math.sqrt(t*t+n*n)<u.sensitivity){clearTimeout(c);for(let e of s)e.isActive&&(u.onExit(e),e.isActive=!1);u.onEnter(e),e.isActive=!0}else l=o,i=r,a=setTimeout((function(){d(e)}),u.interval)};!function(e,t){if(!t||!t.onEnter||!t.onExit)throw"onEnter and onExit callbacks must be provided";u=function(e,t){for(let n in t)e[n]=t[n];return e}(n,t),s=e;for(let e of s)e.isActive=!1,e.addEventListener("mousemove",f),e.addEventListener("mouseenter",(function(t){l=t.pageX,i=t.pageY,e.isActive?clearTimeout(c):a=setTimeout((function(){d(e)}),u.interval)})),e.addEventListener("mouseleave",(function(t){clearTimeout(a),e.isActive&&(c=setTimeout((function(){u.onExit(e),e.isActive=!1}),u.exitDelay))}))}(e,t)},SV=window.SV||{},SV.Modal=function(e){var t,n,o,r={getModalElement:function(){return t},getContentElement:function(){return o},getTitleElement:function(){return n},inject:function(e,r){t&&(n&&(n.innerHTML=r),o&&(o.innerHTML=e))},show:function(){t&&t.classList.add("visible")},close:function(){t&&(t.classList.remove("visible"),setTimeout((function(e){n&&(n.innerHTML=""),o&&(o.innerHTML=""),t.dispatchEvent(new CustomEvent("sv.modal.close"))}),400))},resizeContent:function(e,n){t&&(o.style.width=o.offsetWidth+"px",o.style.height=o.offsetHeight+"px",e&&n&&(o.style.width=e+"px",o.style.height=n+"px"),setTimeout((function(e){t.dispatchEvent(new CustomEvent("sv.modal.resize"))}),400))}};return function(e){(t=document.createElement("div")).id=e,t.classList.add("modal-wrapper"),t.innerHTML='<div class="modal"><span class="modal-close" title="Close">&times;</span><h3 class="modal-title"></h3><div class="modal-content"></div></div>',document.querySelector("body").appendChild(t),n=t.querySelector(".modal-title"),o=t.querySelector(".modal-content"),t.addEventListener("click",(function(e){var t=e.target.classList;(t.contains("modal-wrapper")||t.contains("modal-close"))&&r.close()}))}(e),r},SV=window.SV||{},SV.Tabs=function(e,t){const n={equalHeight:!1,useAnchors:!1};let o,r,l,i,s={},a={};const c=function(e){let t=e.getAttribute("href");return t?t.replace("#",""):""};return a.showTab=function(e){let t=!1;for(let n=0;n<l.length;n++){const o=l[n],r=i[n];c(o)===e?(o.classList.add("active"),0===n&&(t=!0)):o.classList.remove("active"),r.id===e?r.classList.add("active"):r.classList.remove("active")}if(s.useAnchors&&history.replaceState){var n=t?window.location.pathname+window.location.search:"#tab="+e;history.replaceState(null,null,n)}},function(){s=function(e,t){for(let n in t)e[n]=t[n];return e}(n,t);let u="HTML structure is incorrect";if(o=e.querySelector(":scope > .sv-tabs-tab-list"),r=e.querySelector(":scope > .sv-tabs-panel-list"),!o||!r)throw u;if(l=o.querySelectorAll(":scope > .sv-tabs-tab"),i=r.querySelectorAll(":scope > .sv-tabs-panel"),!l||!i)throw u;const f=l.length,d=i.length;if(f!==d)throw"Number of tabs ("+f+") does not match number of panels ("+d+")";if(o.addEventListener("click",(function(e){e.preventDefault();let t=e.target.closest(".sv-tabs-tab");if(!t)return;let n=c(t);a.showTab(n)})),s.equalHeight){let e=0;Array.from(i).forEach((function(t){let n=function(e){if("none"!==getComputedStyle(e).display)return e.offsetHeight;e.style.display="block";let t=e.offsetHeight;return e.style.display="",t}(t);e=Math.max(e,n)})),r.style.height=e+"px"}let p=location.hash.match(/#tab=(.+)/);p?a.showTab(p[1]):l[0]&&a.showTab(c(l[0]))}(),a},SV=window.SV||{},SV.Sortable=function(e,t){const n={initialSort:!1,sortFns:{int:function(e,t){return parseInt(e,10)-parseInt(t,10)},float:function(e,t){return parseFloat(e)-parseFloat(t)},string:function(e,t){return e.toString().localeCompare(t.toString())},"string-ins":function(e,t){return e=e.toString().toLocaleLowerCase(),t=t.toString().toLocaleLowerCase(),e.localeCompare(t)}}};let o={};const r={asc:"asc",desc:"desc"};let l={dir:r};const i=function(e,t){for(let n in t)e[n]="sortFns"===n?i(e[n],t[n]):t[n];return e},s=function(t){let n=t.getAttribute("data-sort");if(!n)return;let l=function(e){Array.from(e.parentElement.children);let t=0;for(let n of e.parentElement.children){if(n===e)return t;let o=n.getAttribute("colspan")||1;t+=parseInt(o,10)}throw"Header cell not found in table"}(t),i=o.sortFns[n]||o.sortFns.string,s=t.getAttribute("data-sort-dir")===r.asc?r.desc:r.asc;const a={th:t,column:l,dir:s};e.dispatchEvent(new CustomEvent("sv.sortable.before",{detail:a})),setTimeout((function(){let n=function(e,t,n){let o=[];for(let n of e){let e=n.children[t];if(!e)continue;let r=e.getAttribute("data-sort-value");null===r&&(r=e.textContent),o.push([r,n])}return o.sort((function(e,t){return n(e[0],t[0])})),o.map((function(e){return e[1]}))}(e.querySelectorAll(":scope > tbody > tr"),l,i);s===r.desc&&n.reverse();let o=e.querySelector("tbody");for(let e of n)o.appendChild(e);let a=e.querySelectorAll("thead th");for(let e of a)e===t?(t.setAttribute("data-sort-dir",s),t.classList.add("sorting-"+s)):(e.removeAttribute("data-sort-dir"),e.classList.remove("sorting-asc","sorting-desc"));e.dispatchEvent(new CustomEvent("sv.sortable.after"))}),10)};return l.sortColumn=function(e){let t=l.getThByIndex(e);t&&s(t)},l.getThByIndex=function(t){let n=Array.from(e.querySelectorAll(":scope > thead > tr > th")),o=0;for(let e=0;e<n.length;e++){let r=n[e];if(o>=t)return r;let l=r.getAttribute("colspan")||1;o+=parseInt(l,10)}return null},o=i(n,t),e.addEventListener("click",(function(e){let t=e.target.closest("th");t&&s(t)})),!1!==o.initialSort&&l.sortColumn(o.initialSort),l},SV=window.SV||{},SV.Filtable=function(e,t,n){const o={};let r={};const l={text:{selector:'input[type="text"]',event:"keyup"},select:{selector:"select",event:"change"},checkbox:{selector:'input[type="checkbox"]',event:"click"}};let i=[],s={};const a=function(e,t){for(let n of t)if(n=parseInt(n,10),-1==e.indexOf(n))throw"Error: invalid column specified in data-filter-col attribute"},c=function(){let t=[];const n=function(){const t=e.querySelectorAll(":scope > tbody > tr:first-child > td").length;let n=[];for(let e=0;e<t;e++)n.push(e);return n}();for(let e of i){let o=[],r=e.getAttribute("data-filter-col");r?(o=r.toString().split(","),a(n,o)):o=n;let i="";if(e.matches(l.checkbox.selector)){let t=e.getAttribute("data-filter-value");i=e.checked&&null!==t?t:""}else i=e.value;t.push({columns:o,value:i})}return t},u=function(e,t){const n=e.querySelectorAll(":scope > td");for(let e of t){if(0==e.value.length)continue;let t=!1;for(let l of e.columns){let i=n[l],s=i.getAttribute("data-filter-value");if(s)e.value==s&&(t=!0);else{let n=i.textContent;o=n,r=e.value,-1!=o.toLocaleLowerCase().indexOf(r.toLocaleLowerCase())&&(t=!0)}}if(!t)return!1}var o,r;return!0},f=function(){var e=window.location.hash.replace("#","");if(0===e.length)return{};var t={},n=e.split("&");for(let e of n){var o=e.split("=");2===o.length&&(t[o[0]]=o[1])}return t},d=function(){let e=f();for(let n in e)fieldElem=t.querySelector('[data-filter-hash="'+n+'"]'),fieldElem&&(fieldElem.value=e[n])},p=function(e){let t=e.getAttribute("data-filter-hash");if(!t)return;let n=f();n[t]=e.value;let o="#";for(let e in n)0!==n[e].length&&("#"!==o&&(o+="&"),o+=e+"="+n[e]);"#"===o&&(o=window.location.pathname+window.location.search),window.history.replaceState(void 0,void 0,o)};return s.applyFilter=function(t){e.dispatchEvent(new CustomEvent("sv.filtable.before")),setTimeout((function(){let n=e.querySelectorAll(":scope > tbody > tr");for(let e of n)u(e,t)?e.classList.remove("hidden"):e.classList.add("hidden");e.dispatchEvent(new CustomEvent("sv.filtable.after"))}),10)},function(){r=function(e,t){for(let n in t)e[n]=t[n];return e}(o,n);for(let e in l){let n=l[e],o=t.querySelectorAll(n.selector);for(let e of o)i.push(e),e.addEventListener(n.event,(function(t){let n=c();s.applyFilter(n),p(e)}))}window.addEventListener("hashchange",(function(e){d(),s.applyFilter(c())})),d(),s.applyFilter(c())}(),s},String.prototype.contains=function(e){return-1!=this.toLowerCase().indexOf(e.toLowerCase())},Element.prototype.matches||(Element.prototype.matches=Element.prototype.msMatchesSelector||Element.prototype.webkitMatchesSelector),String.prototype.escapeHtml=function(){return this.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;")};var lazyImageObserver,cmpPokemonNatlDex=function(e,t){return e.national==t.national?e.id-t.id:e.national-t.national};function buildParamString(e){e=e||{};var t="";for(var n in e)t+="&"+n+"="+encodeURIComponent(e[n]);return t.substr(1)}function sortableSetBlankValues(e,t,n){if(!(null!==n.th.getAttribute("data-blanks")))return;const o=["","-","N/A","—"],r="99999",l="-99999";let i=elQSA("tbody td:nth-child("+(n.column+1)+")",t);for(let t of i){let i=t.textContent.trim();if(o.indexOf(i)<0)continue;let s=t.getAttribute("data-sort-value");if([r,l,null].indexOf(s)<0)continue;let a=n.dir===e.dir.asc?r:l;t.setAttribute("data-sort-value",a)}}function docReady(e){"loading"!==document.readyState?e():document.addEventListener("DOMContentLoaded",e)}function onEvent(e,t,n,o){if(e){var r=t.split(" ");for(var l in o=o||{},r)e.addEventListener(r[l],n,o)}}function onDelegatedEvent(e,t,n,o,r){if(e){var l=n.split(" ");r=r||{};var i=function(e){var n=e.target.closest(t);n&&o(e,n)};for(var s in l)e.addEventListener(l[s],i,r)}}function elId(e,t){return(t=t||document).getElementById(e)}function elClass(e,t){return(t=t||document).getElementsByClassName(e)}function elTag(e,t){return(t=t||document).getElementsByTagName(e)}function elQS(e,t){return(t=t||document).querySelector(e)}function elQSA(e,t){return(t=t||document).querySelectorAll(e)}function ajaxRequest(e,t,n,o,r){var l=buildParamString(n),i=null;"GET"===e&&l.length>0&&(t+="?"+l);var s=new XMLHttpRequest;s.open(e,t),"POST"===e&&(s.setRequestHeader("Content-type","application/x-www-form-urlencoded"),i=l);var a=function(){"function"==typeof r&&r()};s.onload=function(){200==this.status?"function"==typeof o&&o(this.response):a()},s.onerror=a,s.send(i)}docReady((function(){var e=elQSA(".main-menu-list > li > a");for(let t of e)t.removeAttribute("href");var t=elClass("main-menu-item"),n="main-menu-item-active";onDelegatedEvent(elQS(".main-menu-list"),".main-menu-heading","touchend click",(function(e,o){var r=o.parentElement;if(r.classList.contains(n))r.classList.remove(n);else{for(let e of t)e.classList.remove(n);r.classList.add(n)}e.preventDefault()}));new SV.HoverIntent(t,{onEnter:function(e){e.classList.add(n)},onExit:function(e){e.classList.remove(n)},exitDelay:600})}));var usingLazyLoadFallback=!0;function lazyLoadReplaceImage(e){var t=e.getAttribute("class")||"",n=e.getAttribute("style")||"",o=n?' style="'+n+'"':"",r=e.getAttribute("title")||"",l=r?' title="'+r+'"':"",i=e.getAttribute("data-srcset")||"",s=i?' srcset="'+i+'"':"";e.parentElement&&(e.outerHTML='<img class="'+t+'" src="'+e.getAttribute("data-src")+'" alt="'+e.getAttribute("data-alt")+'"'+l+o+s+">")}function elementNearViewport(e){var t=e.getBoundingClientRect(),n=500;return t.bottom>=-500&&t.right>=-500&&t.top<=n+(window.innerHeight||document.documentElement.clientHeight)&&t.left<=n+(window.innerWidth||document.documentElement.clientWidth)}function lazyLoadImages(){for(var e=elQSA(".lazyload-resp[data-src], .img-fixed[data-src]"),t=0;t<e.length;t++)elementNearViewport(e[t])&&lazyLoadReplaceImage(e[t])}if("IntersectionObserver"in window)usingLazyLoadFallback=!1,docReady((function(){lazyImageObserver=new IntersectionObserver((function(e,t){e.forEach((function(e){e.isIntersecting&&(lazyLoadReplaceImage(e.target),lazyImageObserver.unobserve(e.target))}))}),{rootMargin:"400px"});for(var e=elQSA(".lazyload-resp[data-src], .img-fixed[data-src]"),t=0;t<e.length;t++)lazyImageObserver.observe(e[t])}));else{onEvent(window,"load scroll resize",lazyLoadImages,{passive:!0});for(var scrollWrappers=elQSA(".resp-scroll"),i=0;i<scrollWrappers.length;i++)onEvent(scrollWrappers[i],"scroll",lazyLoadImages,{passive:!0})}docReady((function(){if(localStorage){var e=void 0!==localStorage.gdpr,t=elQS(".gdpr-link"),n=!1;if(!e||t){var o=new SV.Modal("gdpr-confirm"),r=o.getModalElement();r.addEventListener("sv.modal.close",(function(){localStorage.gdpr=n?1:0})),o.getContentElement().style.width="480px";var l="Privacy control",i='<p class="text-small">We use adverts to cover the costs of running this site, which may use personal information that you have provided to our ad partners (e.g. Google) to show more relevant ads. You may opt out if you wish and see generic adverts.</p><p class="text-right"><a class="text-small gdpr-decline" href="#">Opt out</a> &nbsp;&nbsp;&nbsp; <button class="btn btn-primary gdpr-accept" style="min-width:80px">OK</button></p>';e||(o.inject(i,l),o.show()),onEvent(t,"click",(function(e){e.preventDefault(),o.inject(i,l),o.show()})),onEvent(r,"click",(function(e){var t=e.target.classList;((n=t.contains("gdpr-decline"))||t.contains("gdpr-accept"))&&(e.preventDefault(),o.close())}))}}})),docReady((function(){let e=13,t=27,n=38,o=40,r=new SV.LocalDb("/json/",localDbVersions),l=elId("sitesearch"),i=elQS(".sitesearch-results"),s=function(){r.load(["searchdata"],a.appMain),l.removeEventListener("focus",s)};onEvent(l,"focus",s);let a={maxResults:12,tmplResult:function(e){let t=e.type.replace("_","-"),n=e.type.charAt(0).toUpperCase()+e.type.substr(1).replace("_"," ");return'<a class="sitesearch-results-item" href="/'+t+"/"+e.alias+'"><span class="ent-name" >'+e.name+'</span> <small class="sitesearch-results-type">'+n+"</small></a>"},clearResults:function(e){e.innerHTML="",e.classList.remove("sitesearch-active")},outputResults:function(e,t){if(0===t.length)return void this.clearResults(e);let n="";for(let e of t)n+=a.tmplResult(e);e.innerHTML=n,e.classList.add("sitesearch-active")},searchResults:function(e){let t=r.table("searchdata"),n=[];for(let o in t)for(let r in t[o]){let l=t[o][r];if((l[0].contains(e)||l[1].contains(e))&&(n.push({type:o,name:t[o][r][0],alias:t[o][r][1]}),n.length>=a.maxResults))return n}return n},selectResultsItem:function(e){for(let t of i.children)t===e?t.classList.add("sitesearch-results-item-active"):t.classList.remove("sitesearch-results-item-active")},appMain:function(){let r=null;onEvent(l,"keyup focus",(function(e){if(e.which==o){let e=r?r.nextElementSibling:i.firstChild;r=e||r,a.selectResultsItem(r)}else if(e.which==n)r=r?r.previousElementSibling:null,a.selectResultsItem(r);else if(e.which==t)a.clearResults(i),l.blur();else{let e=l.value;if(e.length>=2){let t=a.searchResults(e);a.outputResults(i,t)}else a.outputResults(i,[]);r=null}})),onEvent(l,"blur",(function(){setTimeout((function(){a.clearResults(i)}),200)})),onEvent(l,"keydown",(function(t){if(t.which==e){let e=r?r.getAttribute("href"):"";e&&(t.preventDefault(),window.location.href=e)}else(t.which==n||t.which==o)&&t.preventDefault()})),onDelegatedEvent(i,".sitesearch-results-item","mouseover",(function(e,t){r=t,a.selectResultsItem(t)}))}}})),SV=window.SV||{},SV.LocalDb=function(e,t){let n={};const o=e,r=t;let l={};const i=function(e){return"object"==typeof localStorage[e]&&null!==localStorage[e]},s=function(e){return n.versions[e]||0},a=function(e,t){let o={};try{o=JSON.parse(e)}catch(e){throw"Server response was not JSON"}n[t]=o,localStorage[t]=e,function(e){n.versions[e]=r,localStorage.versions=JSON.stringify(n.versions)}(t)},c=function(e){ajaxRequest("GET",o+e,{},(function(t){a(t,e)}),(function(){throw"Error fetching data from server"}))},u=function(e,t){let o=!0;for(let t of e){let e=localStorage[t];!e||s(t)<r?o=!1:n[t]||(n[t]=JSON.parse(e))}o?setTimeout(t,10):setTimeout((function(){u(e,t)}),500)};return l.load=function(e,t){let n=[];for(let t of e)(!i(t)||s(t)<r)&&n.push(t);for(let e of n)c(e);u(e,t)},l.table=function(e){return n[e]},n.versions=localStorage.versions?JSON.parse(localStorage.versions):{},l};