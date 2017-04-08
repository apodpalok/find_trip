define(["./core","./var/document","./var/rcssNum","./var/rnothtmlwhite","./css/var/cssExpand","./css/var/isHiddenWithinTree","./css/var/swap","./css/adjustCSS","./data/var/dataPriv","./css/showHide","./core/init","./queue","./deferred","./traversing","./manipulation","./css","./effects/Tween"],function(e,t,n,i,s,o,r,u,a,f){"use strict";function l(){v&&(t.hidden===!1&&window.requestAnimationFrame?window.requestAnimationFrame(l):window.setTimeout(l,e.fx.interval),e.fx.tick())}function d(){return window.setTimeout(function(){g=undefined}),g=e.now()}function c(e,t){var n,i=0,o={height:e};for(t=t?1:0;i<4;i+=2-t)n=s[i],o["margin"+n]=o["padding"+n]=e;return t&&(o.opacity=o.width=e),o}function p(e,t,n){for(var i,s=(m.tweeners[t]||[]).concat(m.tweeners["*"]),o=0,r=s.length;o<r;o++)if(i=s[o].call(n,t,e))return i}function h(t,n,i){var s,r,u,l,d,c,h,w,m="width"in n||"height"in n,g=this,v={},x=t.style,q=t.nodeType&&o(t),T=a.get(t,"fxshow");i.queue||(l=e._queueHooks(t,"fx"),null==l.unqueued&&(l.unqueued=0,d=l.empty.fire,l.empty.fire=function(){l.unqueued||d()}),l.unqueued++,g.always(function(){g.always(function(){l.unqueued--,e.queue(t,"fx").length||l.empty.fire()})}));for(s in n)if(r=n[s],y.test(r)){if(delete n[s],u=u||"toggle"===r,r===(q?"hide":"show")){if("show"!==r||!T||T[s]===undefined)continue;q=!0}v[s]=T&&T[s]||e.style(t,s)}if((c=!e.isEmptyObject(n))||!e.isEmptyObject(v)){m&&1===t.nodeType&&(i.overflow=[x.overflow,x.overflowX,x.overflowY],h=T&&T.display,null==h&&(h=a.get(t,"display")),w=e.css(t,"display"),"none"===w&&(h?w=h:(f([t],!0),h=t.style.display||h,w=e.css(t,"display"),f([t]))),("inline"===w||"inline-block"===w&&null!=h)&&"none"===e.css(t,"float")&&(c||(g.done(function(){x.display=h}),null==h&&(w=x.display,h="none"===w?"":w)),x.display="inline-block")),i.overflow&&(x.overflow="hidden",g.always(function(){x.overflow=i.overflow[0],x.overflowX=i.overflow[1],x.overflowY=i.overflow[2]})),c=!1;for(s in v)c||(T?"hidden"in T&&(q=T.hidden):T=a.access(t,"fxshow",{display:h}),u&&(T.hidden=!q),q&&f([t],!0),g.done(function(){q||f([t]),a.remove(t,"fxshow");for(s in v)e.style(t,s,v[s])})),c=p(q?T[s]:0,s,g),s in T||(T[s]=c.start,q&&(c.end=c.start,c.start=0))}}function w(t,n){var i,s,o,r,u;for(i in t)if(s=e.camelCase(i),o=n[s],r=t[i],Array.isArray(r)&&(o=r[1],r=t[i]=r[0]),i!==s&&(t[s]=r,delete t[i]),(u=e.cssHooks[s])&&"expand"in u){r=u.expand(r),delete t[s];for(i in r)i in t||(t[i]=r[i],n[i]=o)}else n[s]=o}function m(t,n,i){var s,o,r=0,u=m.prefilters.length,a=e.Deferred().always(function(){delete f.elem}),f=function(){if(o)return!1;for(var e=g||d(),n=Math.max(0,l.startTime+l.duration-e),i=n/l.duration||0,s=1-i,r=0,u=l.tweens.length;r<u;r++)l.tweens[r].run(s);return a.notifyWith(t,[l,s,n]),s<1&&u?n:(u||a.notifyWith(t,[l,1,0]),a.resolveWith(t,[l]),!1)},l=a.promise({elem:t,props:e.extend({},n),opts:e.extend(!0,{specialEasing:{},easing:e.easing._default},i),originalProperties:n,originalOptions:i,startTime:g||d(),duration:i.duration,tweens:[],createTween:function(n,i){var s=e.Tween(t,l.opts,n,i,l.opts.specialEasing[n]||l.opts.easing);return l.tweens.push(s),s},stop:function(e){var n=0,i=e?l.tweens.length:0;if(o)return this;for(o=!0;n<i;n++)l.tweens[n].run(1);return e?(a.notifyWith(t,[l,1,0]),a.resolveWith(t,[l,e])):a.rejectWith(t,[l,e]),this}}),c=l.props;for(w(c,l.opts.specialEasing);r<u;r++)if(s=m.prefilters[r].call(l,t,c,l.opts))return e.isFunction(s.stop)&&(e._queueHooks(l.elem,l.opts.queue).stop=e.proxy(s.stop,s)),s;return e.map(c,p,l),e.isFunction(l.opts.start)&&l.opts.start.call(t,l),l.progress(l.opts.progress).done(l.opts.done,l.opts.complete).fail(l.opts.fail).always(l.opts.always),e.fx.timer(e.extend(f,{elem:t,anim:l,queue:l.opts.queue})),l}var g,v,y=/^(?:toggle|show|hide)$/,x=/queueHooks$/;return e.Animation=e.extend(m,{tweeners:{"*":[function(e,t){var i=this.createTween(e,t);return u(i.elem,e,n.exec(t),i),i}]},tweener:function(t,n){e.isFunction(t)?(n=t,t=["*"]):t=t.match(i);for(var s,o=0,r=t.length;o<r;o++)s=t[o],m.tweeners[s]=m.tweeners[s]||[],m.tweeners[s].unshift(n)},prefilters:[h],prefilter:function(e,t){t?m.prefilters.unshift(e):m.prefilters.push(e)}}),e.speed=function(t,n,i){var s=t&&"object"==typeof t?e.extend({},t):{complete:i||!i&&n||e.isFunction(t)&&t,duration:t,easing:i&&n||n&&!e.isFunction(n)&&n};return e.fx.off?s.duration=0:"number"!=typeof s.duration&&(s.duration in e.fx.speeds?s.duration=e.fx.speeds[s.duration]:s.duration=e.fx.speeds._default),null!=s.queue&&s.queue!==!0||(s.queue="fx"),s.old=s.complete,s.complete=function(){e.isFunction(s.old)&&s.old.call(this),s.queue&&e.dequeue(this,s.queue)},s},e.fn.extend({fadeTo:function(e,t,n,i){return this.filter(o).css("opacity",0).show().end().animate({opacity:t},e,n,i)},animate:function(t,n,i,s){var o=e.isEmptyObject(t),r=e.speed(n,i,s),u=function(){var n=m(this,e.extend({},t),r);(o||a.get(this,"finish"))&&n.stop(!0)};return u.finish=u,o||r.queue===!1?this.each(u):this.queue(r.queue,u)},stop:function(t,n,i){var s=function(e){var t=e.stop;delete e.stop,t(i)};return"string"!=typeof t&&(i=n,n=t,t=undefined),n&&t!==!1&&this.queue(t||"fx",[]),this.each(function(){var n=!0,o=null!=t&&t+"queueHooks",r=e.timers,u=a.get(this);if(o)u[o]&&u[o].stop&&s(u[o]);else for(o in u)u[o]&&u[o].stop&&x.test(o)&&s(u[o]);for(o=r.length;o--;)r[o].elem!==this||null!=t&&r[o].queue!==t||(r[o].anim.stop(i),n=!1,r.splice(o,1));!n&&i||e.dequeue(this,t)})},finish:function(t){return t!==!1&&(t=t||"fx"),this.each(function(){var n,i=a.get(this),s=i[t+"queue"],o=i[t+"queueHooks"],r=e.timers,u=s?s.length:0;for(i.finish=!0,e.queue(this,t,[]),o&&o.stop&&o.stop.call(this,!0),n=r.length;n--;)r[n].elem===this&&r[n].queue===t&&(r[n].anim.stop(!0),r.splice(n,1));for(n=0;n<u;n++)s[n]&&s[n].finish&&s[n].finish.call(this);delete i.finish})}}),e.each(["toggle","show","hide"],function(t,n){var i=e.fn[n];e.fn[n]=function(e,t,s){return null==e||"boolean"==typeof e?i.apply(this,arguments):this.animate(c(n,!0),e,t,s)}}),e.each({slideDown:c("show"),slideUp:c("hide"),slideToggle:c("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(t,n){e.fn[t]=function(e,t,i){return this.animate(n,e,t,i)}}),e.timers=[],e.fx.tick=function(){var t,n=0,i=e.timers;for(g=e.now();n<i.length;n++)(t=i[n])()||i[n]!==t||i.splice(n--,1);i.length||e.fx.stop(),g=undefined},e.fx.timer=function(t){e.timers.push(t),e.fx.start()},e.fx.interval=13,e.fx.start=function(){v||(v=!0,l())},e.fx.stop=function(){v=null},e.fx.speeds={slow:600,fast:200,_default:400},e});