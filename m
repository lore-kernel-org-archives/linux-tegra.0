From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL 1/6] ARM: tegra: cleanups and fixes
Date: Sun,  4 Mar 2012 12:13:57 -0800
Message-ID: <1330892042-32065-2-git-send-email-olof@lixom.net>
References: <1330892042-32065-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330892042-32065-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The following changes since commit a5f17d1f4c2831b9b9bf8b1a537cdbac995d6e13:

  Merge tag 'v3.3-rc2' into depends/rmk/for-armsoc (2012-02-07 15:05:20 -0800)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git tags/tegra-cleanups

for you to fetch changes up to f6a1ba67362fe78a1ec81c355ee638c70689b5d7:

  ARM: tegra: Enable CPUIdle on Tegra20 (2012-03-04 11:17:17 -0800)

----------------------------------------------------------------
Minor fixes that weren't urgent enough to go into 3.3. The two paz00
patches are in mainline already but got merged after the branch point
for this branch, so they're duplicated. I also ended up merging in
rmk/for-armsoc into this later on to fix a bug introduced by it, so it's
included but it's not the base of this branch.

----------------------------------------------------------------
Arnd Bergmann (3):
      ARM: tegra: select CPU_FREQ_TABLE
      ARM: tegra: build localtimer support only when needed
      ARM: tegra: export usb phy symbols

Marc Dietrich (2):
      ARM: tegra: paz00: fix wrong SD1 power gpio
      ARM: tegra: paz00: fix wrong UART port on mini-pcie plug

Olof Johansson (1):
      Merge branch 'depends/rmk/for-armsoc' into for-3.4/cleanup-and-fixes

Peter De Schrijver (1):
      ARM: tegra: Enable CPUIdle on Tegra20

Stephen Warren (1):
      ARM: tegra: select required CPU and L2 errata options

 arch/arm/boot/dts/tegra-paz00.dts |    6 +++---
 arch/arm/mach-tegra/Kconfig       |   14 ++++++++++++++
 arch/arm/mach-tegra/Makefile      |    3 ++-
 arch/arm/mach-tegra/board-paz00.c |    8 ++++----
 arch/arm/mach-tegra/board-paz00.h |    2 +-
 arch/arm/mach-tegra/common.c      |    2 --
 arch/arm/mach-tegra/usb_phy.c     |   11 +++++++++++
 7 files changed, 35 insertions(+), 11 deletions(-)
