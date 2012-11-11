library toastd;

import 'dart:html';
import 'package:rikulo/effect.dart';

class Toast {
  Element el;
  Element messageEl;
  Element titleEl;
  EasingFunction ef1 = (num t) => t * t;

  static final Map defaults = {
    'tapToDismiss' : true,
    'toastClass' : 'toast',
    'containerId' : 'toast-container',
    'debug' : false,
    'fadeIn' : 300,
    'fadeOut' : 1000,
    'extendedTimeOut' : 1000,
    'iconClass' : 'toast-info',
    'positionClass' : 'toast-top-right',
    'timeOut' : 5000, // Set timeOut to 0 to make it sticky
    'titleClass' : 'toast-title',
    'messageClass' : 'toast-message'
  };

  static Element container;
  static Element getContainer() {
    if (container == null) {
      container = new Element.html("<div id='${defaults['containerId']}' class='${defaults['positionClass']}' />");
      document.body.elements.add(container);
    }
    return container;
  }

  Toast(String message, String title, Map options) {
    defaults.forEach((k,v) {
      if (!options.containsKey(k)) {
        options[k] = v;
      }
    });

    el = new Element.html("<div class='${options['toastClass']} ${options['iconClass']}'/>");

    if (title != null) {
      titleEl = new Element.html("<div class='${options['titleClass']}'>$title</div>");
      el.nodes.add(titleEl);
    }

    if (message != null) {
      messageEl = new Element.html("<div class='${options['messageClass']}'>$message</div>");
      el.nodes.add(messageEl);
    }

    Toast.getContainer().nodes.add(el);

    window.setTimeout(() => this.fade(), options['timeOut']);
  }

  Toast.info(String message, String title) : this(message, title, {
    'iconClass' : 'toast-info'
  });

  Toast.success(String message, String title) : this(message, title, {
    'iconClass' : 'toast-success'
  });

  Toast.error(String message, String title) : this(message, title, {
    'iconClass' : 'toast-error'
  });

  Toast.warning(String message, String title) : this(message, title, {
    'iconClass' : 'toast-warning'
  });

  void fade() {
    new FadeOutEffect(this.el, period: 500, easing: this.ef1, end: (MotionState state) => this.el.remove()).run();
  }
}
