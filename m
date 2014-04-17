From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [RESEND PATCH 0/7] Add cros_ec changes for newer boards
Date: Thu, 17 Apr 2014 11:36:47 -0700
Message-ID: <1397759814-3588-1-git-send-email-dianders@chromium.org>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jdelvare-l3A5Bk7waGM@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kevin.strasser-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shane.huang-5C7GfCeVMHo@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, galak@codeaurora
List-Id: linux-tegra@vger.kernel.org

This series adds the most critical cros_ec changes for newer boards
using cros_ec.  Specifically:
* Fixes timing/locking issues with the previously upstreamed (but
  never used upstream) cros_ec_spi driver.
* Updates the cros_ec header file to the latest version which allows
  us to use newer EC features like i2c tunneling.
* Adds an i2c tunnel driver to allow communication to the EC's i2c
  devices.

This _doesn't_ get the EC driver fully up to speed with what's in the
current Chromium OS trees.  There are a whole slew of cleanup patches
there, an addition of an LPC transport mode, and exports of functions
to userspace.  Once these patches land and we have functionality we
can continue to pick more cleanup patches.


Bill Richardson (1):
  mfd: cros_ec: Sync to the latest cros_ec_commands.h from EC sources

David Hendricks (1):
  mfd: cros_ec: spi: calculate delay between transfers correctly

Doug Anderson (5):
  mfd: cros_ec: spi: Add mutex to cros_ec_spi
  mfd: cros_ec: spi: Make the cros_ec_spi timeout more reliable
  mfd: cros_ec: spi: Increase cros_ec_spi deadline from 5ms to 100ms
  i2c: ChromeOS EC tunnel driver
  ARM: tegra: Add the EC i2c tunnel to tegra124-venice2

 .../devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt |   36 +
 arch/arm/boot/dts/tegra124-venice2.dts             |   27 +
 drivers/i2c/busses/Kconfig                         |    9 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            |  304 ++++++
 drivers/mfd/cros_ec.c                              |    7 +-
 drivers/mfd/cros_ec_spi.c                          |   67 +-
 include/linux/mfd/cros_ec.h                        |    4 +-
 include/linux/mfd/cros_ec_commands.h               | 1128 ++++++++++++++++++--
 9 files changed, 1491 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
 create mode 100644 drivers/i2c/busses/i2c-cros-ec-tunnel.c

-- 
1.9.1.423.g4596e3a
