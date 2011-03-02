From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH 0/3] ARM: tegra: PCI-e improvements
Date: Wed,  2 Mar 2011 14:34:03 +0200
Message-ID: <cover.1299068166.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,
This patches add PCI-e powergating support and fix for TrimSlice PCI-e initialization in the mutliplatform kernels.

The patches are also available at git repository 
  git://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux-tegra.git trimslice/upstream

The following changes since commit ccac05152e7c6a8103b9e7a801bc995180a800fc:

  ARM: Tegra: DMA: Fail safe if initialization fails (2011-02-23 14:06:03 -0800)

Mike Rapoport (3):
  ARM: tegra: PCIE minor code refactoring
  ARM: tegra: add PCI Express power gating
  ARM: tegra: trimslice: initialize PCI-e only when running on
    TrimSlice

 arch/arm/mach-tegra/board-trimslice.c |    3 ++
 arch/arm/mach-tegra/pcie.c            |   38 ++++++++++++++++++++++++--------
 2 files changed, 31 insertions(+), 10 deletions(-)

-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
