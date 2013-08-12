From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/6] USB tree changes for Tegra30 and Tegra114 USB Host support
Date: Mon, 12 Aug 2013 16:06:48 +0300
Message-ID: <1376312814-18992-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,

Here are the patches for the USB tree to enable USB Host support on Tegra30 and
Tegra114. These are based on my and Mikko's cleanup patches that just got
merged to Felipe's tree.

The first one touches the core hub code to prevent certain (non-standard) clock
disable features as our controller doesn't support those.
The rest are changes to our PHY and EHCI drivers to deal with a few changed
register addresses and a few additional PHY parameters that need to be set
for proper signal quality.

v2 diff:
Patch 1: Added Alan's ack
Patch 2 & 5: Change register bitmasks to not contain shifted-out bits
Changed the order of patches 4 & 5
Patch 5: Don't touch new PHY params under T20

v3 diff:
Patch 6: Removed useless cast
Added Stephen's Reviewed-by & Tested-by to all patches

Tuomas Tynkkynen (6):
  usb: host: add has_tdi_phy_lpm capability bit
  usb: phy: tegra: Fix wrong PHY parameters
  usb: phy: tegra: Tegra30 support
  Documentation: New DT parameters for tegra30-usb-phy
  usb: phy: tegra: Program new PHY parameters
  usb: host: tegra: Tegra30 support

 .../bindings/usb/nvidia,tegra20-usb-phy.txt        |  15 +-
 drivers/usb/chipidea/host.c                        |   1 +
 drivers/usb/host/ehci-hub.c                        |  14 +-
 drivers/usb/host/ehci-tegra.c                      |  34 +++-
 drivers/usb/host/ehci.h                            |   1 +
 drivers/usb/phy/phy-tegra-usb.c                    | 220 ++++++++++++++++-----
 include/linux/usb/tegra_usb_phy.h                  |  23 +++
 7 files changed, 242 insertions(+), 66 deletions(-)

-- 
1.8.1.5
