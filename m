From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 3/4]: usb: host: xhci-tegra: Changes for v4.7-rc1
Date: Fri, 29 Apr 2016 17:52:28 +0200
Message-ID: <1461945149-23686-4-git-send-email-thierry.reding@gmail.com>
References: <1461945149-23686-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461945149-23686-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The following changes since commit 87d66f280672800c9c2ad1ce3b7a993ce1e04769:

  phy: tegra: Add Tegra210 support (2016-04-29 16:44:48 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.7-xhci

for you to fetch changes up to ab065e969640d9afd3967266eb3193fb3ac298bd:

  usb: xhci: tegra: Add Tegra210 support (2016-04-29 16:48:59 +0200)

This depends on pull request 1/4 containing the PHY changes.

Thierry

----------------------------------------------------------------
usb: host: xhci-tegra: Changes for v4.7-rc1

This set of patches introduces a driver for the XUSB controller found on
NVIDIA Tegra SoCs. When loaded with a firmware (available via the linux-
firmware repository), it provides an XHCI-compatible interface.

----------------------------------------------------------------
Thierry Reding (5):
      Merge branch 'for-4.7/phy' into for-4.7/xhci
      dt-bindings: usb: Add NVIDIA Tegra XUSB controller binding
      dt-bindings: usb: xhci-tegra: Add Tegra210 XUSB controller support
      usb: xhci: Add NVIDIA Tegra XUSB controller driver
      usb: xhci: tegra: Add Tegra210 support

 .../bindings/usb/nvidia,tegra124-xusb.txt          |  120 ++
 drivers/usb/host/Kconfig                           |    9 +
 drivers/usb/host/Makefile                          |    1 +
 drivers/usb/host/xhci-tegra.c                      | 1331 ++++++++++++++++++++
 4 files changed, 1461 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
 create mode 100644 drivers/usb/host/xhci-tegra.c
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
