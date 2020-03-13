From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] usb: tegra: Changes for v5.7-rc1
Date: Fri, 13 Mar 2020 18:07:30 +0100
Message-ID: <20200313170730.2924259-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Greg, Felipe,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.7-usb

for you to fetch changes up to 9dd4fbef2f88ccf46f5294805bf121d6554791e8:

  usb: gadget: tegra-xudc: Support multiple device modes (2020-03-13 17:16:28 +0100)

It occurred to me that I could just as well send this pull request to
you guys, rather than take it via ARM SoC. Kishon already acked all the
patches for the PHY tree that this series depends on, so I've included
them here as a dependency.

Let me know if you'd prefer that I take this through ARM SoC.

Thanks,
Thierry

----------------------------------------------------------------
usb: tegra: Changes for v5.7-rc1

These changes add USB OTG support for the XUSB host and XUSB device
controllers found on NVIDIA Tegra SoCs.

----------------------------------------------------------------
JC Kuo (2):
      phy: tegra: xusb: Protect Tegra186 soc with config
      phy: tegra: xusb: Add Tegra194 support

Jon Hunter (1):
      phy: tegra: xusb: Don't warn on probe defer

Nagarjuna Kristam (10):
      phy: tegra: xusb: Add usb-role-switch support
      phy: tegra: xusb: Add usb-phy support
      phy: tegra: xusb: Add support to get companion USB 3 port
      phy: tegra: xusb: Add set_mode support for USB 2 phy on Tegra210
      phy: tegra: xusb: Add set_mode support for UTMI phy on Tegra186
      usb: xhci-tegra: Add OTG support
      usb: gadget: tegra-xudc: Remove usb-role-switch support
      usb: gadget: tegra-xudc: Add usb-phy support
      usb: gadget: tegra-xudc: Use phy_set_mode() to set/unset device mode
      usb: gadget: tegra-xudc: Support multiple device modes

Thierry Reding (1):
      Merge branch 'for-5.7/phy' into for-5.7/usb

 drivers/phy/tegra/Kconfig           |   1 +
 drivers/phy/tegra/Makefile          |   1 +
 drivers/phy/tegra/xusb-tegra186.c   | 261 ++++++++++++++++++++++++++--------
 drivers/phy/tegra/xusb-tegra210.c   | 131 +++++++++++++----
 drivers/phy/tegra/xusb.c            | 189 +++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h            |  10 ++
 drivers/usb/gadget/udc/Kconfig      |   1 -
 drivers/usb/gadget/udc/tegra-xudc.c | 273 +++++++++++++++++++++++++-----------
 drivers/usb/host/xhci-tegra.c       | 228 +++++++++++++++++++++++++++++-
 include/linux/phy/tegra/xusb.h      |   2 +
 10 files changed, 926 insertions(+), 171 deletions(-)
