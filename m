From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/7] ARM: tegra: Add XUSB pad controller support
Date: Fri, 18 Jul 2014 16:45:37 +0200
Message-ID: <1405694740-4090-4-git-send-email-thierry.reding@gmail.com>
References: <1405694740-4090-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405694740-4090-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:

  Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.17-xusb-padctl

for you to fetch changes up to dc0a3938668706f3a63cde4ceb431e9189fb2a0a:

  pinctrl: Add NVIDIA Tegra XUSB pad controller support (2014-07-11 14:41:06 +0200)

----------------------------------------------------------------
ARM: tegra: Add XUSB pad controller support

Adds device tree bindings and a driver for the XUSB pad controller found
on Tegra114 and later. This is a prerequisites for PCIe, SATA and XUSB
drivers which are all currently being reviewed or pending for merge.

This is a separate branch in case it needs to be pulled into the pinctrl
tree to resolve conflicts.

----------------------------------------------------------------
Thierry Reding (2):
      of: Add NVIDIA Tegra XUSB pad controller binding
      pinctrl: Add NVIDIA Tegra XUSB pad controller support

 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        | 127 +++
 drivers/pinctrl/Kconfig                            |   6 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-tegra-xusb.c               | 973 +++++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h   |   7 +
 5 files changed, 1114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
 create mode 100644 drivers/pinctrl/pinctrl-tegra-xusb.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
