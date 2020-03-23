From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 00/10] Introduce NVIDIA Tegra Partition Table
Date: Mon, 23 Mar 2020 19:34:21 +0300
Message-ID: <20200323163431.7678-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some NVIDIA Tegra devices have GPT entry at a wrong location and others may
even not have it at all. So either a custom workaround for GPT parsing or
TegraPT support is needed for those devices if we want to support them in
upstream kernel. The former solution was already rejected [1], let's try
the latter.

[1] https://patchwork.ozlabs.org/patch/1240809/

Big thanks to everyone who helped with figuring out the TegraPT format!

Changelog:

v3: - Fixed "BUG: KASAN: slab-out-of-bounds in tegra_partition". Thanks to
      Peter Geis for noticing the problem.

    - The MMC boot partitions scanning is now opt-in. See this patch:

        mmc: block: Support partition-table scanning on boot partitions

    - The found MMC boot partitions won't be assigned to the MMC boot
      block device ever due to the new GENHD_FL_PART_SCAN_ONCE flag.

      This makes us to ensure that the old behavior of the MMC core is
      preserved for a non-Tegra MMC-block users.

    New patches in v3:

        block: Introduce GENHD_FL_PART_SCAN_ONCE
        mmc: sdhci-tegra: Enable boot partitions scanning on Tegra20 and Tegra30

v2: - Addressed v1 review comments from Stephen Warren by using BIT for
      locating BCT position in IRAM.

    - Added more validations to the TegraPT parser: partition type is
      verified, eMMC instance ID is verified.

    - TegraPT parser now doesn't touch any devices other than eMMC.

    - EKS (encrypted keys) partition is blacklisted now.

    - Implemented eMMC boot partitions scanning. These new patches are
      added in a result:

        mmc: block: Add mmc_bdev_to_part_type() helper
        mmc: block: Add mmc_bdev_to_area_type() helper
        mmc: block: Add MMC_QUIRK_RESCAN_MAIN_BLKDEV
        mmc: block: Enable partition-table scanning for boot partitions
        partitions/tegra: Implement eMMC boot partitions scanning

Dmitry Osipenko (10):
  mmc: core: Add raw_boot_mult field to mmc_ext_csd
  mmc: block: Add mmc_bdev_to_card() helper
  partitions: Introduce NVIDIA Tegra Partition Table
  block: Introduce GENHD_FL_PART_SCAN_ONCE
  mmc: block: Add mmc_bdev_to_part_type() helper
  mmc: block: Add mmc_bdev_to_area_type() helper
  mmc: block: Add MMC_QUIRK_RESCAN_MAIN_BLKDEV
  mmc: block: Support partition-table scanning on boot partitions
  mmc: sdhci-tegra: Enable boot partitions scanning on Tegra20 and
    Tegra30
  partitions/tegra: Implement eMMC boot partitions scanning

 arch/arm/mach-tegra/tegra.c    |  54 +++
 block/genhd.c                  |   2 +-
 block/partition-generic.c      |  13 +-
 block/partitions/Kconfig       |  10 +
 block/partitions/Makefile      |   1 +
 block/partitions/check.c       |   4 +
 block/partitions/tegra.c       | 612 +++++++++++++++++++++++++++++++++
 block/partitions/tegra.h       |   8 +
 drivers/mmc/core/block.c       | 104 ++++++
 drivers/mmc/core/mmc.c         |   2 +
 drivers/mmc/host/sdhci-tegra.c |  10 +-
 include/linux/genhd.h          |  12 +
 include/linux/mmc/blkdev.h     |  15 +
 include/linux/mmc/card.h       |   2 +
 include/linux/mmc/host.h       |   2 +
 include/soc/tegra/bootdata.h   |  46 +++
 include/soc/tegra/common.h     |   9 +
 include/soc/tegra/partition.h  |  91 +++++
 18 files changed, 993 insertions(+), 4 deletions(-)
 create mode 100644 block/partitions/tegra.c
 create mode 100644 block/partitions/tegra.h
 create mode 100644 include/linux/mmc/blkdev.h
 create mode 100644 include/soc/tegra/bootdata.h
 create mode 100644 include/soc/tegra/partition.h

-- 
2.25.1
