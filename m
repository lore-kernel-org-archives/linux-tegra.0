From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/3] Tegra XUDC support on Tegra194 Soc
Date: Mon, 4 May 2020 12:04:38 +0530
Message-ID: <1588574081-23160-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series adds support for XUSB Device Mode support on Tegra194 SoCs.

This patchset is composed with:
 - dt bindings of XUDC driver.
 - USB driver changes to tegra-xudc to add support on Tegra194 Soc.

V2:
 - Added ACKed-by details.
 - Updated commit message for port speed quirk.
 - Fixed checkpatch errors.
 
Nagarjuna Kristam (3):
  dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support
  usb: gadget: tegra-xudc: Add Tegra194 support
  usb: gadget: tegra-xudc: add port_speed_quirk

 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |   2 +
 drivers/usb/gadget/udc/tegra-xudc.c                | 123 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

-- 
2.7.4
