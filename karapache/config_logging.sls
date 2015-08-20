{% from "apache/map.jinja" import apache with context %}

include:
  - apache

install_cronolog:
  pkg.installed:
    - name: cronolog

sym_link_httpd_to_var_logs:
  file.symlink:
    - name: /etc/httpd/logs
    - target: {{ apache.logdir }}

sym_link_apache_httpd_logs_to_mnt_logs:
  file.symlink:
    - name: {{ apache.logdir }}
    - target: /mnt/logs
    - backupname: /var/log/httpd.backup

base_logging_config:
  file.managed:
    - group: root
    - mode: 644
    - name: {{ apache.confdir }}/baselogging.conf
    - require:
      - pkg: apache
    - source: salt://karapache/files/baselogging.conf.jinja
    - template: jinja
    - watch_in:
      - service: apache
    - user: root      
    