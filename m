From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/8] Introduce NVIDIA Tegra Partition Tablex
Date: Fri,  6 Mar 2020 05:12:12 +0300
Message-ID: <20200306021220.22097-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Some NVIDIA Tegra devices have GPT entry at a wrong location and others may
even not have it at all. So either a custom workaround for GPT parsing or
TegraPT support is needed for those devices if we want to support them in
upstream kernel. The former solution was already rejected [1], let's try
the latter.

[1] https://patchwork.ozlabs.org/patch/1240809/

Big thanks to everyone who helped with figuring out the TegraPT format!

Changelog:

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

Dmitry Osipenko (8):
  mmc: core: Add raw_boot_mult field to mmc_ext_csd
  mmc: block: Add mmc_bdev_to_card() helper
  partitions: Introduce NVIDIA Tegra Partition Table
  mmc: block: Add mmc_bdev_to_part_type() helper
  mmc: block: Add mmc_bdev_to_area_type() helper
  mmc: block: Add MMC_QUIRK_RESCAN_MAIN_BLKDEV
  mmc: block: Enable partition-table scanning for boot partitions
  partitions/tegra: Implement eMMC boot partitions scanning

 arch/arm/mach-tegra/tegra.c   |  54 +++
 block/partitions/Kconfig      |   9 +
 block/partitions/Makefile     |   1 +
 block/partitions/check.c      |   4 +
 block/partitions/tegra.c      | 608 ++++++++++++++++++++++++++++++++++
 block/partitions/tegra.h      |  83 +++++
 drivers/mmc/core/block.c      |  85 ++++-
 drivers/mmc/core/mmc.c        |   2 +
 include/linux/mmc/blkdev.h    |  15 +
 include/linux/mmc/card.h      |   2 +
 include/soc/tegra/bootdata.h  |  46 +++
 include/soc/tegra/common.h    |   9 +
 include/soc/tegra/partition.h |  18 +
 13 files changed, 934 insertions(+), 2 deletions(-)
 create mode 100644 block/partitions/tegra.c
 create mode 100644 block/partitions/tegra.h
 create mode 100644 include/linux/mmc/blkdev.h
 create mode 100644 include/soc/tegra/bootdata.h
 create mode 100644 include/soc/tegra/partition.h

-- 
2.25.1
