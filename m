From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/3] Introduce NVIDIA Tegra Partition Table
Date: Tue, 25 Feb 2020 02:18:38 +0300
Message-ID: <20200224231841.26550-1-digetx@gmail.com>
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

Dmitry Osipenko (3):
  mmc: core: Add raw_boot_mult field to mmc_ext_csd
  mmc: block: Add mmc_bdev_to_card() helper
  partitions: Introduce NVIDIA Tegra Partition Table

 arch/arm/mach-tegra/tegra.c         |  35 +++
 block/partitions/Kconfig            |   8 +
 block/partitions/Makefile           |   1 +
 block/partitions/check.c            |   4 +
 block/partitions/tegra.c            | 373 ++++++++++++++++++++++++++++
 block/partitions/tegra.h            |  71 ++++++
 drivers/mmc/core/block.c            |  14 ++
 drivers/mmc/core/mmc.c              |   2 +
 include/linux/mmc/card.h            |   4 +
 include/soc/tegra/bct.h             |  42 ++++
 include/soc/tegra/common.h          |   9 +
 include/soc/tegra/partition_table.h |  18 ++
 12 files changed, 581 insertions(+)
 create mode 100644 block/partitions/tegra.c
 create mode 100644 block/partitions/tegra.h
 create mode 100644 include/soc/tegra/bct.h
 create mode 100644 include/soc/tegra/partition_table.h

-- 
2.24.0
