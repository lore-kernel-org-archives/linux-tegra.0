From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL 6/6] ARM: tegra: board updates
Date: Sun,  4 Mar 2012 12:14:02 -0800
Message-ID: <1330892042-32065-7-git-send-email-olof@lixom.net>
References: <1330892042-32065-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330892042-32065-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The following changes since commit 62aa2b537c6f5957afd98e29f96897419ed5ebab:

  Linux 3.3-rc2 (2012-01-31 13:31:54 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git tags/tegra-boards

for you to fetch changes up to c5444f39620b2b7801eb1997c41befdc8bcf78ea:

  ARM: tegra: match SoC name not board name in DT board files (2012-03-04 10:41:19 -0800)

----------------------------------------------------------------
Tegra board updates. Most of the board updates for tegra30 and for some
of the driver device-tree conversions have gone in through the other
branches, so that leaves quite little left here -- mostly a couple
of updates to the not-yet-converted tegra2 boards and a couple of
device-tree updates.

----------------------------------------------------------------
Marc Dietrich (3):
      ARM: dt: tegra: add ADT7461 temperature sensor to paz00 device tree
      ARM: dt: tegra: add the power gpio key to paz00 device tree
      ARM: dt: tegra: add the wifi led to paz00 device tree

Stephen Warren (1):
      ARM: tegra: match SoC name not board name in DT board files

Thierry Reding (1):
      ARM: tegra: PCIe: Provide 3.3V supply voltage

 arch/arm/boot/dts/tegra-paz00.dts         |   26 ++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-dt-tegra20.c    |    6 +-----
 arch/arm/mach-tegra/board-dt-tegra30.c    |    2 +-
 arch/arm/mach-tegra/board-harmony-power.c |    3 ++-
 4 files changed, 30 insertions(+), 7 deletions(-)
