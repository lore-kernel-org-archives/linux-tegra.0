From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch v3 0/4] Add support for tps65090-charger
Date: Tue, 12 Mar 2013 18:08:05 -0400
Message-ID: <1363126089-9071-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset adds support for the TPS65090-charger. This charger is
registered as a subdevice of the TPS65090 PMIC.

This series includes a fix for the tps65090 header file where all
the interrupts were shifted by 1.

v3:
 - fixed up the tps65090-charger driver to fix build errors/warnings

v2:
 - cleaned up tps65090 driver per comments (mostly var naming)
 - flushed out commit description for driver
 - reordered probe so irq is registered after power_supply and cleaned up 1st


Rhyland Klein (4):
  mfd: tps65090: Fix enum in header file
  mfd: tps65090: Add resources for charger
  power_supply: tps65090-charger: Add binding doc
  power: tps65090: Add support for tps65090-charger

 .../devicetree/bindings/power_supply/tps65090.txt  |   23 ++
 drivers/mfd/tps65090.c                             |   10 +
 drivers/power/Kconfig                              |    7 +
 drivers/power/Makefile                             |    1 +
 drivers/power/tps65090-charger.c                   |  315 ++++++++++++++++++++
 include/linux/mfd/tps65090.h                       |    6 +
 6 files changed, 362 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power_supply/tps65090.txt
 create mode 100644 drivers/power/tps65090-charger.c

-- 
1.7.9.5
