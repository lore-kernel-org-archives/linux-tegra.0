From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL v2] usb: tegra: Changes for v5.7-rc1
Date: Thu, 19 Mar 2020 15:34:11 +0100
Message-ID: <20200319143411.3266037-1-thierry.reding@gmail.com>
References: <20200313170730.2924259-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200313170730.2924259-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Greg, Felipe,

The following changes since commit ca9e742b5c27c230b0bf003aecba2433a60ba837:

  USB: c67x00: Use the correct style for SPDX License Identifier (2020-03-17 20:03:28 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-usb-v2

for you to fetch changes up to b4e19931c98a088fbd80b5c3f892261c9a0e6c23:

  usb: gadget: tegra-xudc: Support multiple device modes (2020-03-19 14:18:57 +0100)

This is a version of the earlier pull request[0], rebased on top of
Greg's usb-next branch and the resulting conflicts resolved. I've also
added a couple of patches in here that fix minor issues that were
reported since last week.

Thanks,
Thierry

----------------------------------------------------------------
usb: tegra: Changes for v5.7-rc1

These changes add USB OTG support for the XUSB host and XUSB device
controllers found on NVIDIA Tegra SoCs.

----------------------------------------------------------------
Corentin Labbe (1):
      phy: tegra: Select USB_PHY

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

Thierry Reding (4):
      phy: tegra: Print -EPROBE_DEFER error message at debug level
      phy: tegra: Fix regulator leak
      phy: tegra: Don't use device-managed API to allocate ports
      Merge branch 'for-5.7/phy' into for-5.7/usb

 drivers/phy/tegra/Kconfig           |   2 +
 drivers/phy/tegra/Makefile          |   1 +
 drivers/phy/tegra/xusb-tegra124.c   |   6 +
 drivers/phy/tegra/xusb-tegra186.c   | 265 ++++++++++++++++++++++++++--------
 drivers/phy/tegra/xusb-tegra210.c   | 136 ++++++++++++++----
 drivers/phy/tegra/xusb.c            | 263 +++++++++++++++++++++++++++++++++-
 drivers/phy/tegra/xusb.h            |  25 ++++
 drivers/usb/gadget/udc/Kconfig      |   1 -
 drivers/usb/gadget/udc/tegra-xudc.c | 275 ++++++++++++++++++++++++------------
 drivers/usb/host/xhci-tegra.c       | 228 +++++++++++++++++++++++++++++-
 include/linux/phy/tegra/xusb.h      |   2 +
 11 files changed, 1024 insertions(+), 180 deletions(-)
