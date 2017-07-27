From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/8] Support UDC on Tegra 20/30/114/124
Date: Thu, 27 Jul 2017 19:46:04 +0300
Message-ID: <cover.1501173271.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some time ago Thierry Reding sent out patches that enabled UDC on NVIDIA
Tegra, unfortunately they haven't got enough traction to get into the
kernel. I've rebased those patches and added a fix for the Ethernet USB
Gadget on Tegra20, Marc Dietrich tested UDC driver on AC100 and Nicolas
Chauvet on TK1. Like an original patchset, this series adds support for
the peripheral mode only.

Changelog:

V2:
1) Added comments to each of patched USB Ethernet gadget models.

2) Added explanatory comment about why usb_phy_set_suspend() invocation
   is necessary in tegra_udc_probe().

3) Dropped TrimSlice from patchset because it turned out that it uses USB1
   controller for USB-to-SATA.

4) Moved tegra_defconfig patch before DT patches as per Stephen's suggestion.

5) Changed dr_mode to "peripheral" in DT patches since we don't support role
   mode switching for now.

Dmitry Osipenko (4):
  usb: gadget: f_ecm/f_eem/f_rndis: Setup quirk_avoids_skb_reserve
  usb: chipidea: udc: Support SKB alignment quirk
  ARM: defconfig: tegra: Enable ChipIdea UDC driver
  ARM: tegra: Enable UDC on AC100

Thierry Reding (4):
  usb: chipidea: Add support for Tegra20/30/114/124
  ARM: tegra: Enable UDC on Beaver
  ARM: tegra: Enable UDC on Dalmore
  ARM: tegra: Enable UDC on Jetson TK1

 arch/arm/boot/dts/tegra114-dalmore.dts    |  10 ++
 arch/arm/boot/dts/tegra124-jetson-tk1.dts |  12 ++-
 arch/arm/boot/dts/tegra20-paz00.dts       |   2 +
 arch/arm/boot/dts/tegra30-beaver.dts      |  10 ++
 arch/arm/configs/tegra_defconfig          |  10 +-
 drivers/usb/chipidea/Makefile             |   1 +
 drivers/usb/chipidea/ci_hdrc_tegra.c      | 160 ++++++++++++++++++++++++++++++
 drivers/usb/chipidea/udc.c                |   3 +
 drivers/usb/gadget/function/f_ecm.c       |   7 ++
 drivers/usb/gadget/function/f_eem.c       |   5 +
 drivers/usb/gadget/function/f_rndis.c     |   4 +
 include/linux/usb/chipidea.h              |   1 +
 12 files changed, 219 insertions(+), 6 deletions(-)
 create mode 100644 drivers/usb/chipidea/ci_hdrc_tegra.c

-- 
2.13.3
