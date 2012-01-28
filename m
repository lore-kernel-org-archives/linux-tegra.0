From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 0/5] paz00 updates for 3.4
Date: Sat, 28 Jan 2012 20:03:03 +0100
Message-ID: <cover.1327776641.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The first two patches contain non-critical bug fixes (wrong power gpio
and wrong uart port). The last three patches add the temperature sensor,
the power gpio, and the wifi led to the device tree.

What's missing (after sound has been added) is rfkill and usb-utmi support.
Is anyone planing to add DT support to these drivers? If not, I will try my
best (you have been warned).

Marc Dietrich (5):
  ARM: tegra: paz00: fix wrong SD1 power gpio
  ARM: tegra: paz00: fix wrong UART port on mini-pcie plug
  ARM: dt: tegra: add ADT7461 temperature sensor to paz00 device tree
  ARM: dt: tegra: add the power gpio key to paz00 device tree
  ARM: dt: tegra: add the wifi led to paz00 device tree

 arch/arm/boot/dts/tegra-paz00.dts |   32 +++++++++++++++++++++++++++++---
 arch/arm/mach-tegra/board-paz00.c |    8 ++++----
 arch/arm/mach-tegra/board-paz00.h |    2 +-
 3 files changed, 34 insertions(+), 8 deletions(-)

-- 
1.7.5.4
