From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [GIT PULL 0/6] TrimSlice backports for linux-tegra-2.6.36
Date: Tue, 29 Mar 2011 10:06:34 +0200
Message-ID: <cover.1301385131.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Colin,

Please consider pulling TrimSlice patches backported to
linux-tegra-2.6.36.

The first patch in the series allows ioremapping of PCI space when
CONFIG_PCI=y.
The rest is the TrimSlice patches merged into the mainline, some of
them were squashed into single commit to reduce the noise.

The following changes since commit d3c9f78e7ec505076ddad2aefaeef5e8c20a4823:

  serial: tegra_hsuart: Make sure current byte rx complete in suspend (2011-03-22 11:40:08 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux-tegra.git trimslice/linux-tegra-2.6.36

Mike Rapoport (6):
      ARM: tegra: allow ioremap for PCI space
      ARM: update mach-types
      tegra: add PCI Express clocks
      tegra: add PCI Express support
      ARM: tegra: add TrimSlice machine
      ARM: tegra: trimslice: enable MMC/SD slots

 arch/arm/mach-tegra/Kconfig                  |   10 +
 arch/arm/mach-tegra/Makefile                 |    4 +
 arch/arm/mach-tegra/board-trimslice-pinmux.c |  150 ++++
 arch/arm/mach-tegra/board-trimslice.c        |  131 ++++
 arch/arm/mach-tegra/board-trimslice.h        |   25 +
 arch/arm/mach-tegra/board.h                  |    1 +
 arch/arm/mach-tegra/include/mach/hardware.h  |    4 +
 arch/arm/mach-tegra/include/mach/io.h        |   10 +
 arch/arm/mach-tegra/io.c                     |   17 +-
 arch/arm/mach-tegra/pcie.c                   |  933 ++++++++++++++++++++++++++
 arch/arm/mach-tegra/tegra2_clocks.c          |   49 ++
 arch/arm/tools/mach-types                    |  284 ++++++++-
 12 files changed, 1610 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/mach-tegra/board-trimslice-pinmux.c
 create mode 100644 arch/arm/mach-tegra/board-trimslice.c
 create mode 100644 arch/arm/mach-tegra/board-trimslice.h
 create mode 100644 arch/arm/mach-tegra/pcie.c

-- 
1.7.3.1
