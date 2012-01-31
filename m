From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/8] Add tegra30 support for secondary cores
Date: Tue, 31 Jan 2012 18:40:38 +0200
Message-ID: <1328028051-24271-1-git-send-email-pdeschrijver@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patchset introduces support for secondary cores on tegra30. It also
introduces some functions for the flowcontroller and adds basic support for
tegra30 powerdomains.

Peter De Schrijver (8):
  ARM: tegra: export the chipid
  ARM: tegra: functions to access the flowcontroller
  ARM: tegra: rework Tegra secondary CPU core bringup
  ARM: tegra: prepare powergate.c for multiple variants
  ARM: tegra: export tegra_powergate_is_powered()
  ARM: tegra: add support for Tegra30 powerdomains
  ARM: tegra: support for Tegra30 CPU powerdomains
  ARM: tegra: support for secondary cores on Tegra30

 arch/arm/mach-tegra/Makefile                 |    2 +
 arch/arm/mach-tegra/common.c                 |    4 +
 arch/arm/mach-tegra/flowctrl.c               |   62 ++++++++
 arch/arm/mach-tegra/flowctrl.h               |    5 +
 arch/arm/mach-tegra/fuse.c                   |   18 ++-
 arch/arm/mach-tegra/fuse.h                   |    4 +
 arch/arm/mach-tegra/headsmp.S                |  192 ++++++++++++++++++++++++-
 arch/arm/mach-tegra/include/mach/iomap.h     |    3 +
 arch/arm/mach-tegra/include/mach/powergate.h |   15 ++-
 arch/arm/mach-tegra/platsmp.c                |  139 +++++++++++++------
 arch/arm/mach-tegra/powergate.c              |   53 +++++++-
 arch/arm/mach-tegra/reset.c                  |   84 +++++++++++
 arch/arm/mach-tegra/reset.h                  |   50 +++++++
 13 files changed, 568 insertions(+), 63 deletions(-)
 create mode 100644 arch/arm/mach-tegra/flowctrl.c
 create mode 100644 arch/arm/mach-tegra/reset.c
 create mode 100644 arch/arm/mach-tegra/reset.h

-- 
1.7.7.rc0.72.g4b5ea.dirty
