From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 0/3] soc/tegra: Turn on XUSB partitions
Date: Tue, 28 Jun 2016 12:20:41 +0100
Message-ID: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra XHCI driver currently assumes the XUSB power partitions have
been enabled by the bootloader. This is not for the Tegra210 Smaug board
and so cause the kernel to hang when enabling XHCI support. Although the
XHCI driver itself needs to manage these partitions, for now enable the
partitions if the XHCI driver is enabled.

In order to do this I have made a fundamental change to the PMC driver
to initialise the power partitions during early init. A benefit of this
is that if CONFIG_PM_GENERIC_DOMAINS is not enabled, then we can simply
turn on the partitions early before any devices are probed.

This is based upon the PMC fixes series [0].

[0] http://marc.info/?l=linux-tegra&m=146711078013182&w=2

Jon Hunter (3):
  soc/tegra: pmc: Initialise power partitions early
  soc/tegra: pmc: Enable XUSB partitions on boot
  arm64: tegra210: Add XUSB powergates

 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 +++++++++++++++++
 drivers/soc/tegra/pmc.c                  | 45 ++++++++++++++++++++++++--------
 2 files changed, 58 insertions(+), 11 deletions(-)

-- 
2.1.4
