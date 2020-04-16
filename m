From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 0/4] Tegra XUDC support on Tegra194 Soc
Date: Thu, 16 Apr 2020 13:04:16 +0530
Message-ID: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series adds support for XUSB Device Mode support on Tegra194 SoCs.

This patchset is composed with:
 - dt bindings of XUDC driver.
 - dt changes to add xudc node on Tegra194 Soc.
 - USB driver changes to tegra-xudc to add support on Tegra194 Soc. 

Nagarjuna Kristam (4):
  dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support
  arm64: tegra: Add xudc node for Tegra194
  usb: gadget: tegra-xudc: Add Tegra194 support
  usb: gadget: tegra-xudc: add port_speed_quirk

 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |   2 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  18 +++
 drivers/usb/gadget/udc/tegra-xudc.c                | 130 +++++++++++++++++++++
 3 files changed, 150 insertions(+)

-- 
2.7.4
