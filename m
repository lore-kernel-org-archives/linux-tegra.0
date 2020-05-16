From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 0/6] Introduce NVIDIA Tegra Partition Table
Date: Sat, 16 May 2020 18:36:38 +0300
Message-ID: <20200516153644.13748-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-block-owner@vger.kernel.org>
Sender: linux-block-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, =?UTF-8?q?Nils=20=C3=96stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Steve McIntyre <steve@einval.com>, Randy Dunlap <rdunlap@infradead.org>, linux-efi <linux-efi@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hello,

This series adds support for the NVIDIA Tegra Partition Table format,
which is needed in order to support consumer-grade Tegra-based devices
by the upstream kernel.  These devices have Secure Boot enabled and it
can't be disabled, and thus, it's not possible to easily modify bootloader
and eMMC storage partitioning.

Big thanks to everyone who helped with figuring out the TegraPT format
and with testing!

Changelog:

v5: - Corrected Kconfig dependency, like it was suggested by Randy Dunlap
      in the review comment to v4.

    - Corrected a typo in the commit message, which was spotted by
      Steve McIntyre in v4.

    - The new force_gpt_sector variable has been moved out to the common
      parser state because I realized that multiple drives could be scanned
      simultaneously, and thus, a global shared variable isn't a suitable
      variant.

    - The Tegra's enforced GPT-scan now supports older bootloader versions,
      which do not provide the gpt_sector= command line option.  The gpt_sector
      should be calculated using NVIDIA's algorithm in this case.

v4: - Scanning of the eMMC boot partitions has been dropped because it
      requires a bit too messy hacks in the kernel.  We can live without
      this feature, at least for now it's not really needed.

    - Instead of the dropped boot partitions scanning, the "gpt_sector="
      command line option has been brought back [1].  But now it's done
      in a different way, not bothering platforms other than Tegra and
      not touching block devices other than eMMC, which was requested during
      of the [1] review.  The "gpt_sector=" usage is needed when partition
      table is inaccessible by kernel, which is the case for the Ouya game
      console device for example.  Please note that "gpt_sector=" is not
      available on all devices, such devices will fall back to the TegraPT,
      Samsung Galaxy Tab 10.1 is an example of a such device.

      [1] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200219162339.16192-1-digetx@gmail.com/

    - We got a bit more broad testing and discovered that Samsung Galaxy
      Tab 10.1 uses 2K logical sectors instead of 4K.  So the 2K sectors
      are supported now by the TegraPT parser.  Thanks to Nils Östlund for
      the testing!

    - TegraPT parser now utilizes "tegraboot=" cmdline option which is
      passed to kernel by the NVIDIA's bootloader.  It's used for verifying
      that SDMMC device is *the* boot source.

    - Added patch that exposes Boot Configuration Table to userspace via
      sysfs.  Thanks to Michał Mirosław for the suggestion!

    - Misc changes:
        - The EB2 (second bootloader) partition is added to the list of
          known partitions.  Used by the Galaxy Tab 10.

        - The blkdev logical sector size is checked now, for consistency.
          It always should be 512 bytes on the supported/tested devices.

        - Verbose error messages are replaced with pr_debug().

v3: - Fixed "BUG: KASAN: slab-out-of-bounds in tegra_partition".  Thanks to
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

    - Implemented eMMC boot partitions scanning.  These new patches are
      added in a result:

        mmc: block: Add mmc_bdev_to_part_type() helper
        mmc: block: Add mmc_bdev_to_area_type() helper
        mmc: block: Add MMC_QUIRK_RESCAN_MAIN_BLKDEV
        mmc: block: Enable partition-table scanning for boot partitions
        partitions/tegra: Implement eMMC boot partitions scanning

Dmitry Osipenko (6):
  mmc: core: Add raw_boot_mult field to mmc_ext_csd
  mmc: block: Add mmc_bdev_to_card() helper
  partitions: Introduce NVIDIA Tegra Partition Table
  partitions/efi: Support GPT entry lookup at a non-standard location
  partitions/tegra: Support enforced GPT scanning
  soc/tegra: Expose Boot Configuration Table via sysfs

 arch/arm/mach-tegra/tegra.c   |  58 ++++
 block/partitions/Kconfig      |   8 +
 block/partitions/Makefile     |   1 +
 block/partitions/check.h      |   3 +
 block/partitions/core.c       |   4 +
 block/partitions/efi.c        |  14 +
 block/partitions/tegra.c      | 624 ++++++++++++++++++++++++++++++++++
 drivers/mmc/core/block.c      |  15 +
 drivers/mmc/core/mmc.c        |   2 +
 drivers/soc/tegra/Makefile    |   1 +
 drivers/soc/tegra/bootdata.c  |  51 +++
 drivers/soc/tegra/common.c    |  17 +
 include/linux/mmc/blkdev.h    |  13 +
 include/linux/mmc/card.h      |   1 +
 include/soc/tegra/bootdata.h  |  48 +++
 include/soc/tegra/common.h    |  12 +
 include/soc/tegra/partition.h |  84 +++++
 17 files changed, 956 insertions(+)
 create mode 100644 block/partitions/tegra.c
 create mode 100644 drivers/soc/tegra/bootdata.c
 create mode 100644 include/linux/mmc/blkdev.h
 create mode 100644 include/soc/tegra/bootdata.h
 create mode 100644 include/soc/tegra/partition.h

-- 
2.26.0
