From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] defconfigs: add MTD_SPI_NOR (dependency for M25P80)
Date: Thu, 17 Apr 2014 00:21:44 -0700
Message-ID: <1397719309-2022-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steven Miao <realmz6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, adi-buildroot-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi all,

We are introducing a new SPI-NOR library/framework for MTD, to support various
types of SPI-NOR flash controllers which require (or benefit from) intimate
knowledge of the flash interface, rather than just the relatively dumb SPI
interface. This library borrows much of the m25p80 driver for its abstraction
and moves this code into a spi-nor module.

This means CONFIG_M25P80 now has a dependency on CONFIG_MTD_SPI_NOR, which
should be added to the defconfigs. I'm not sure what is the best process for
doing this. Should each $ARCH maintainer just take their respective patch, even
if the MTD_SPI_NOR Kconfig symbol is not defined for them yet? Or should
maintainers plan on merging the relevant SPI-NOR code into their trees during
the development cycle? Or some third option?

Anyway, the patches are here. Please keep general comments to the cover letter,
so all parties can see.

This series is based on the development repo for MTD, in the 'spinor' branch:

  git://git.infradead.org/l2-mtd.git +spinor

This series is available in the same repo at:

  git://git.infradead.org/l2-mtd.git +defconfigs

I tried locally merging this into linux-next and saw a trivial conflict in
arch/arm/configs/shmobile_defconfig. I can resubmit based on an appropriate
tree, if requested.

Thanks,
Brian

P.S. I was going to purely automatically generate this diff as follows, but
it generated a lot of defconfig noise:

	#!/bin/sh
	for i in arm blackfin mips powerpc sh
	do 
		for j in `git grep -l M25P80 arch/$i/configs`
		do 
			echo $j
			cp $j .config
			echo CONFIG_MTD_SPI_NOR=y >> .config
			make ARCH=$i savedefconfig
			mv defconfig $j
		done
	done

So I did a mixed approach, where I filtered most of the noise out of the diff.

Brian Norris (5):
  ARM: defconfigs: add MTD_SPI_NOR (new dependency for M25P80)
  blackfin: defconfigs: add MTD_SPI_NOR (new dependency for M25P80)
  mips: defconfigs: add MTD_SPI_NOR (new dependency for M25P80)
  powerpc: defconfigs: add MTD_SPI_NOR (new dependency for M25P80)
  sh: defconfig: add MTD_SPI_NOR (new dependency for M25P80)

 arch/arm/configs/bockw_defconfig               | 2 +-
 arch/arm/configs/dove_defconfig                | 2 +-
 arch/arm/configs/imx_v6_v7_defconfig           | 1 +
 arch/arm/configs/keystone_defconfig            | 1 +
 arch/arm/configs/kirkwood_defconfig            | 1 +
 arch/arm/configs/koelsch_defconfig             | 1 +
 arch/arm/configs/lager_defconfig               | 1 +
 arch/arm/configs/lpc32xx_defconfig             | 2 +-
 arch/arm/configs/multi_v5_defconfig            | 1 +
 arch/arm/configs/multi_v7_defconfig            | 1 +
 arch/arm/configs/mvebu_v5_defconfig            | 1 +
 arch/arm/configs/mvebu_v7_defconfig            | 1 +
 arch/arm/configs/mxs_defconfig                 | 1 +
 arch/arm/configs/sama5_defconfig               | 2 +-
 arch/arm/configs/shmobile_defconfig            | 1 +
 arch/arm/configs/tegra_defconfig               | 1 +
 arch/blackfin/configs/BF526-EZBRD_defconfig    | 2 +-
 arch/blackfin/configs/BF527-EZKIT-V2_defconfig | 2 +-
 arch/blackfin/configs/BF527-EZKIT_defconfig    | 2 +-
 arch/blackfin/configs/BF548-EZKIT_defconfig    | 2 +-
 arch/blackfin/configs/BF609-EZKIT_defconfig    | 2 +-
 arch/blackfin/configs/BlackStamp_defconfig     | 3 +--
 arch/blackfin/configs/H8606_defconfig          | 3 +--
 arch/mips/configs/ath79_defconfig              | 3 +--
 arch/mips/configs/db1xxx_defconfig             | 1 +
 arch/mips/configs/rt305x_defconfig             | 2 +-
 arch/powerpc/configs/corenet32_smp_defconfig   | 2 +-
 arch/powerpc/configs/corenet64_smp_defconfig   | 2 +-
 arch/powerpc/configs/mpc85xx_defconfig         | 2 +-
 arch/powerpc/configs/mpc85xx_smp_defconfig     | 2 +-
 arch/sh/configs/sh7757lcr_defconfig            | 2 +-
 31 files changed, 31 insertions(+), 21 deletions(-)

-- 
1.8.3.2
