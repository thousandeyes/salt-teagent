{% import_yaml "te-agent/te-agent.conf.yml" as config %}
{%- set OS = grains['os'] -%}
{%- set CODENAME = grains['oscodename'] -%}
{%- set MRELEASE = grains['osmajorrelease'] -%}
{%- set ARCH = grains['osarch'] -%}
{%- if OS == 'CentOS' and MRELEASE|int < 7 -%}
  {#- note: This handles issue with init system on CentOS < 7 versions.
  -#}
  {%- set INIT = 'rh_service' -%}
{%- else -%}
  {%- set INIT = grains['init'] -%}
{%- endif -%}

te-agent:
  {%- if config.set_repo|default(true) %}
  pkgrepo.managed:
    {%- if OS == 'RedHat' or OS == 'CentOS' and MRELEASE|int >= 6 %}
      - baseurl: http://yum.thousandeyes.com/{{ OS }}/{{ MRELEASE }}/{{ ARCH }}
      - gpgkey: http://yum.thousandeyes.com/RPM-GPG-KEY-thousandeyes
      - gpgcheck: 1
    {%- elif OS == 'Ubuntu' and CODENAME == 'xenial' or CODENAME == 'trusty' %}
      - name: deb http://apt.thousandeyes.com/ {{ CODENAME }} main
      - keyid: BE718900
      - keyserver: http://apt.thousandeyes.com/thousandeyes-apt-key.pub
    {% else %}
      {{ salt.test.exception("Only Ubuntu 14.04 (trusty), 16.04 (xenial), CentOS 6.3 or newer are supported. Please contact support") }}
    {% endif %}
  {% endif -%}
  pkg.installed:
    - name: te-agent
  file.managed:
    - name: /etc/te-agent.cfg
    - source: salt://te-agent/te-agent.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
      {% for key, value in config.items() -%}
        {{key}}: {{value}}
      {% endfor %}
  service.running:
    - enable: True
    - provider: {{ INIT }}

{% if config.browserbot|default(false) %}
te-browserbot:
  pkg.installed:
    - name: te-browserbot
  service.running:
    - enable: True
    - provider: {{ INIT }}
{% endif -%}

{% if config.agent_utils|default(false) %}
te-agent-utils:
  pkg.installed:
    - name: te-agent-utils
{% endif -%}

{% if config.international_langs|default(false) %}
te-intl-fonts:
  pkg.installed:
    - name: te-intl-fonts
{% endif -%}
