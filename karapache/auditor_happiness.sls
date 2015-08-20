{% from "apache/map.jinja" import apache with context %}

include:
  - apache
  
apache_confd_turn_off_TraceEnable:
  file.managed:
    - group: root
    - mode: 644
    - name: {{ apache.confdir }}/z_trace_enable.conf
    - require:
      - pkg: apache
    - source: salt://karapache/files/z_trace_enable.conf
    - template: jinja
    - watch_in:
      - module: apache-restart
    - user: root
    
apache_confd_mod_status_limits:
  file.managed:
    - group: root
    - mode: 644
    - name: {{ apache.confdir }}/z_mod_status_limits.conf
    - require:
      - pkg: apache
    - source: salt://karapache/files/z_mod_status_limits.conf
    - template: jinja
    - watch_in:
      - module: apache-restart
    - user: root
    
