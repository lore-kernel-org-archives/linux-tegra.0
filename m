From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH v2 0/3] Harmony PCI-e and regulators
Date: Wed,  9 Mar 2011 16:31:16 +0200
Message-ID: <cover.1299680416.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

These patches provide update for Harmony PCI-e intialization and add
registration of the TPS65862 PMIC.
Additionally, there are several tegra_defconfig updates. These updates
allow booting the Harmony with PCI-e enabled and add ability to boot
TrimSlice with root on NFS.

v2 changes:
   * rework the TPS65862 PMIC initialization as suggested by Mark
   * rebase the patches on top of Olof's board-for-next branch

Mike Rapoport (3):
  ARM: tegra: harmony: update PCI-e initialization sequence
  ARM: tegra: harmony: initialize the TPS65862 PMIC
  ARM: tegra: update defconfig

 arch/arm/configs/tegra_defconfig          |   12 +++-
 arch/arm/mach-tegra/Makefile              |    1 +
 arch/arm/mach-tegra/board-harmony-pcie.c  |   24 ++++++-
 arch/arm/mach-tegra/board-harmony-power.c |  117 +++++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-harmony.c       |    1 +
 arch/arm/mach-tegra/board-harmony.h       |    1 +
 6 files changed, 153 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/mach-tegra/board-harmony-power.c

-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
