From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [GIT PULL]: TrimSlice update
Date: Tue, 08 Mar 2011 11:01:37 +0200
Message-ID: <4D75F071.7050401@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Colin,

Please pull last minute update for the TrimSlice that enables the SD
slots on the platform.

The patches are based on your current for-next branch.

The following changes since commit d5fdafd38ca0c28c4648909ce0afd0a5420309ca:

  ARM: tegra: trimslice: initialize PCI-e only when running on TrimSlice
(2011-03-03 13:57:31 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux-tegra.git
trimslice/upstream

Mike Rapoport (1):
      ARM: tegra: trimslice: enable MMC/SD slots

 arch/arm/mach-tegra/board-trimslice-pinmux.c |    9 +++++++++
 arch/arm/mach-tegra/board-trimslice.c        |   19 +++++++++++++++++++
 arch/arm/mach-tegra/board-trimslice.h        |    3 +++
 3 files changed, 31 insertions(+), 0 deletions(-)


-- 
Sincerely yours,
Mike.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
