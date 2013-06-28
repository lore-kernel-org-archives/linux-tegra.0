From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/9] Tegra USB cleanup series
Date: Sat, 29 Jun 2013 00:36:58 +0300
Message-ID: <1372455427-20898-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

Here's a few cleanup patches for the Tegra USB drivers, to be applied on top
of Mikko's two patch sets. It mostly deals with removing all usage of platform
data and using standard helpers and enums instead of Tegra-specific ones.

Tuomas Tynkkynen (9):
  usb: phy: tegra: Remove unnecessary 'dev' field
  usb: host: tegra: Remove leftover code
  usb: tegra: host: Remove references to plat data
  ARM: tegra: Remove USB platform data
  usb: phy: tegra: Register as an USB PHY.
  usb: host: tegra: Locate a PHY via standard API
  usb: phy: tegra: Remove custom PHY locating APIs
  usb: phy: tegra: Use DT helpers for phy_type
  usb: phy: tegra: Use DT helpers for dr_mode

 arch/arm/mach-tegra/tegra.c             | 38 +------------
 drivers/usb/host/ehci-tegra.c           | 37 +++----------
 drivers/usb/phy/phy-tegra-usb.c         | 96 ++++++++++++++++-----------------
 include/linux/platform_data/tegra_usb.h | 32 -----------
 include/linux/usb/tegra_usb_phy.h       | 16 +-----
 5 files changed, 53 insertions(+), 166 deletions(-)
 delete mode 100644 include/linux/platform_data/tegra_usb.h

-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
