From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 1/4]: phy: tegra: Changes for v4.7-rc1
Date: Fri, 29 Apr 2016 17:52:26 +0200
Message-ID: <1461945149-23686-2-git-send-email-thierry.reding@gmail.com>
References: <1461945149-23686-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461945149-23686-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The following changes since commit 3358d2d9f47af86bdd71edb24b361f72a54ec04e:

  clk: tegra: Add interface to enable hardware control of SATA/XUSB PLLs (2016-04-28 12:41:44 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.7-phy

for you to fetch changes up to 87d66f280672800c9c2ad1ce3b7a993ce1e04769:

  phy: tegra: Add Tegra210 support (2016-04-29 16:44:48 +0200)

This depends on the first patch of a separate branch that will be
merged through the clk tree.

Thierry

----------------------------------------------------------------
phy: tegra: Changes for v4.7-rc1

This set of patches adds support for the Tegra XUSB pad controller. The
controller provides a set of pads (lanes) that are used for I/O by other
IP blocks within Tegra SoCs (PCIe, SATA and XUSB).

----------------------------------------------------------------
Thierry Reding (6):
      Merge branch 'for-4.7/clk' into for-4.7/phy
      phy: core: Allow children node to be overridden
      dt-bindings: phy: Add NVIDIA Tegra XUSB pad controller binding
      dt-bindings: phy: tegra-xusb-padctl: Add Tegra210 support
      phy: Add Tegra XUSB pad controller support
      phy: tegra: Add Tegra210 support

 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |  733 +++++++
 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |    6 +
 Documentation/phy.txt                              |   16 +-
 drivers/phy/Kconfig                                |    2 +
 drivers/phy/Makefile                               |    2 +
 drivers/phy/phy-core.c                             |   50 +-
 drivers/phy/tegra/Kconfig                          |    8 +
 drivers/phy/tegra/Makefile                         |    6 +
 drivers/phy/tegra/xusb-tegra124.c                  | 1752 +++++++++++++++++
 drivers/phy/tegra/xusb-tegra210.c                  | 2045 ++++++++++++++++++++
 drivers/phy/tegra/xusb.c                           | 1021 ++++++++++
 drivers/phy/tegra/xusb.h                           |  421 ++++
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |   20 +-
 include/linux/phy/phy.h                            |   31 +-
 include/linux/phy/tegra/xusb.h                     |   30 +
 include/soc/tegra/fuse.h                           |    1 +
 16 files changed, 6110 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
 create mode 100644 drivers/phy/tegra/Kconfig
 create mode 100644 drivers/phy/tegra/Makefile
 create mode 100644 drivers/phy/tegra/xusb-tegra124.c
 create mode 100644 drivers/phy/tegra/xusb-tegra210.c
 create mode 100644 drivers/phy/tegra/xusb.c
 create mode 100644 drivers/phy/tegra/xusb.h
 create mode 100644 include/linux/phy/tegra/xusb.h
