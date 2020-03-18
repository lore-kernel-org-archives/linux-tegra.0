From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 0/8] Tegra XUSB charger detect support
Date: Wed, 18 Mar 2020 16:00:59 +0530
Message-ID: <1584527467-8058-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series adds charger detect support on XUSB hardware used in
Tegra210 and Tegra186 SoCs.

This patchset is composed with :
 - dt bindings of XUSB Pad Controller
 - Tegra XUSB device mode driver to add vbus_draw support 
 - Tegra PHY driver for charger detect support

Tests done:
 - Connect USB cable from ubuntu host to micro-B port of DUT to detect
   SDP_TYPE charger
 - Connect USB cable from external powered USB hub(which inturn connects
   to ubuntu host) to micro-B port of DUT to detect CDP_TYPE charger.
 - Connect USB cable from USB charger to micro-B port of DUT to detect
   DCP_TYPE charger.
DUT: Jetson-tx1, Jetson tx2.

Nagarjuna Kristam (8):
  dt-bindings: phy: tegra-xusb: Add charger-detect property
  usb: gadget: tegra-xudc: Add vbus_draw support
  phy: tegra: xusb: Add support for UTMI pad power control
  phy: tegra: xusb: Add USB2 pad power control support for Tegra210
  phy: tegra: xusb: Add soc ops API to enable UTMI PAD protection
  phy: tegra: xusb: Add support for charger detect
  phy: tegra: xusb: Enable charger detect for Tegra186
  phy: tegra: xusb: Enable charger detect for Tegra210

 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |   4 +
 drivers/phy/tegra/Makefile                         |   2 +-
 drivers/phy/tegra/xusb-tegra-cd.c                  | 300 +++++++++++++++++++++
 drivers/phy/tegra/xusb-tegra186.c                  |  92 +++++--
 drivers/phy/tegra/xusb-tegra210.c                  | 222 +++++++++++----
 drivers/phy/tegra/xusb.c                           |  80 ++++++
 drivers/phy/tegra/xusb.h                           |  22 ++
 drivers/usb/gadget/udc/tegra-xudc.c                |  16 ++
 8 files changed, 653 insertions(+), 85 deletions(-)
 create mode 100644 drivers/phy/tegra/xusb-tegra-cd.c

-- 
2.7.4
