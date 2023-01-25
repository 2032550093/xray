#!/bin/bash
# Debian 9 & 10 x64
# Ubuntu 18.04 & 20.04 x64
# License forever-FREE-trial Autosript XRay by Du(^_^)De

systemctl daemon-reload
systemctl enable xray
systemctl restart xray
systemctl restart nginx
systemctl enable runn
systemctl restart runn
