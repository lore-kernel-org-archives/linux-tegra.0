From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/2] usb: phy: tegra: Read UTMI parameters from device tree
Date: Wed, 26 Jun 2013 15:34:38 +0300
Message-ID: <1372250080-10945-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset moves the USB UTMI interface parameters from hardcoded tables
in the PHY driver to device tree and adds code to read them from there.

Mikko Perttunen (2):
  ARM: dts: tegra20: Rename USB UTMI parameters according to new
    definitions
  usb: phy: tegra: Read UTMIP parameters from device tree

 arch/arm/boot/dts/tegra20.dtsi  |  28 ++++-----
 drivers/usb/phy/phy-tegra-usb.c | 129 +++++++++++++++++++++++++++-------------
 2 files changed, 101 insertions(+), 56 deletions(-)

-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
