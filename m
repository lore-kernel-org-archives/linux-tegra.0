From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=200/3=5D=20Tegra=20EMC=20clock=20scaling=20API?=
Date: Fri, 14 Dec 2012 21:14:43 +0100
Message-ID: <1355516086-11116-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series is more of a RFC, but is working pretty well already.

It adds a new API to control EMC performance. There are two new
functions added, to provide memory clients with a way to
communicate their memory performance demands to the EMC.
Documentation can be found inline.

I've tested this on my Colibri T20 with a memory config with the
following DDR clock rates: 88.25MHz, 133.2MHz, 166.5MHz, 333MHz.

I've verified that CPU clock changes toggle EMC clock changes, just
like before the change. Also with a 1080p display attached DDR
clock rate stays at 133,2MHz to satisfy the bandwidth demand of
the scanout.

With the series applied I no longer see display corruption caused
by FIFO underflow, while keeping the ability to demand scale the
EMC clockrate.

Lucas Stach (3):
  ARM: tegra: add EMC clock scaling API
  ARM: tegra: use new EMC clock scaling API in CPUfreq driver
  ARM: tegra: drm: use new EMC clock scaling API to reserve DC
    bandwidth

 arch/arm/mach-tegra/cpu-tegra.c        | 15 +++---
 arch/arm/mach-tegra/tegra2_emc.c       | 84 ++++++++++++++++++++++++++=
++++++--
 drivers/gpu/drm/tegra/dc.c             | 11 +++++
 include/memory/tegra_emc_performance.h | 79 ++++++++++++++++++++++++++=
++++++
 4 Dateien ge=C3=A4ndert, 179 Zeilen hinzugef=C3=BCgt(+), 10 Zeilen ent=
fernt(-)
 create mode 100644 include/memory/tegra_emc_performance.h

--=20
1.7.11.7
