From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH 0/2] ARM: tegra: add TrimSlice support
Date: Mon,  7 Feb 2011 10:10:51 +0200
Message-ID: <cover.1297063443.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

These patches add basic support for TrimSlice platform.
The mach-types update is required until the updated machine registry
is merged, otherwise the kernel would not build.

The patches are also available at git repository 
  git://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux-tegra.git trimslice/upstream

The following changes since commit 8dbdea8444d303a772bceb1ba963f0e3273bfc5e:

  Merge branch 'ixp4xx' of git://git.kernel.org/pub/scm/linux/kernel/git/chris/linux-2.6 (2011-02-06 12:05:58 -0800)

Mike Rapoport (2):
  ARM: update trimslice entry in the machine registry
  ARM: tegra: add TrimSlice board

 arch/arm/mach-tegra/Kconfig                  |    6 +
 arch/arm/mach-tegra/Makefile                 |    3 +
 arch/arm/mach-tegra/board-trimslice-pinmux.c |  145 ++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-trimslice.c        |  104 ++++++++++++++++++
 arch/arm/mach-tegra/board-trimslice.h        |   22 ++++
 arch/arm/tools/mach-types                    |    2 +-
 6 files changed, 281 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-tegra/board-trimslice-pinmux.c
 create mode 100644 arch/arm/mach-tegra/board-trimslice.c
 create mode 100644 arch/arm/mach-tegra/board-trimslice.h

-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
