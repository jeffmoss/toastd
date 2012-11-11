library toastr;

import 'dart:html';
import 'package:rikulo/effect.dart';

Map defaults = {
  'tapToDismiss' : true,
  'toastClass' : 'toast',
  'containerId' : 'toast-container',
  'debug' : false,
  'fadeIn' : 300,
  'fadeOut' : 1000,
  'extendedTimeOut' : 1000,
  'iconClasses': {
    'error' : 'toast-error',
    'info' : 'toast-info',
    'success' : 'toast-success',
    'warning' : 'toast-warning'
  },
  'iconClass' : 'toast-info',
  'positionClass' : 'toast-top-right',
  'timeOut' : 5000, // Set timeOut to 0 to make it sticky
  'titleClass' : 'toast-title',
  'messageClass' : 'toast-message'
};

class Toast {
  Element el;
  Element messageEl;
  Element titleEl;

  EasingFunction ef1 = (num t) => t * t;

  Toast(String message, String title, Map options) {
    el = new Element.html('<div/>');

    if (message != null) {
      messageEl = new Element.html("<div>$message</div>");
      el.nodes.add(messageEl);
    }
    if (title != null) {
      titleEl = new Element.html("<div>$title</div>");
      el.nodes.add(messageEl);
    }
    document.body.elements.add(el);

    window.setTimeout(() => this.fade(), defaults['timeOut']);
  }

  Toast.info(String message, String title) : this(message, title, {
    'iconClass' : defaults['iconClasses']['info']
  });

  Toast.success(String message, String title) : this(message, title, {
    'iconClass' : defaults['iconClasses']['success']
  });

  Toast.error(String message, String title) : this(message, title, {
    'iconClass' : defaults['iconClasses']['error']
  });

  Toast.warning(String message, String title) : this(message, title, {
    'iconClass' : defaults['iconClasses']['warning']
  });

  // Behaviors
  void fade() {
    new FadeOutEffect(this.el, period: 500, easing: this.ef1);
  }
}

