From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC v2 0/3] Add DT Binding for Power-Supply power-supply property
Date: Thu, 21 Feb 2013 18:11:09 -0500
Message-ID: <1361488272-21010-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series is an attempt to define a common way for devicetree
initialized power_supplies to define their list of supplicants
in a common manner.

Instead of relying on custom properties which contain is list of
strings, use the much more direct method of phandles to reference
the supplies and define a common function which can retrieve them
automatically.

Changes:
 - v2: Inverted the logic so that supplies (batteries) contain a list
       of the supplies (chargers) which supply them.



Rhyland Klein (3):
  power_supply: Define Binding for supplied-nodes
  power: power_supply: Add core support for supplied_nodes
  power: power_supply: add support for getting supplied-nodes from dt

 .../bindings/power_supply/power_supply.txt         |   23 ++++++
 drivers/power/power_supply_core.c                  |   81 +++++++++++++++++---
 include/linux/power_supply.h                       |    9 +++
 3 files changed, 101 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power_supply/power_supply.txt

-- 
1.7.9.5
