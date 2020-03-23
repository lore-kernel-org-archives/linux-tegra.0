From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 08/10] mmc: block: Support partition-table scanning on boot partitions
Date: Mon, 23 Mar 2020 19:34:29 +0300
Message-ID: <20200323163431.7678-9-digetx@gmail.com>
References: <20200323163431.7678-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200323163431.7678-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some NVIDIA Tegra devices store partition table on a boot eMMC partition,
and thus, boot partitions need to be scanned. This patch enables scanning
of the boot MMC partitions, but only if MMC host allows to do that. This
patch adds new scan_mmc_boot_partitions field to the struct MMC host,
which should be set to true by the platform-specific SDHCI drivers if
MMC boot partitions scanning is desired.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/mmc/core/block.c | 26 ++++++++++++++++++++++++++
 include/linux/mmc/host.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 2c2bec114fd6..d22498bd9968 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -2334,6 +2334,22 @@ static inline int mmc_blk_readonly(struct mmc_card *card)
 	       !(card->csd.cmdclass & CCC_BLOCK_WRITE);
 }
 
+static bool mmc_blk_boot_part_scan(struct mmc_blk_data *md,
+				   struct mmc_card *card)
+{
+	if (!(md->area_type & MMC_BLK_DATA_AREA_BOOT))
+		return false;
+
+	/*
+	 * Platform driver shall explicitly allow the boot partitions
+	 * scanning because this is a non-standard behavior.
+	 */
+	if (!card->host->scan_mmc_boot_partitions)
+		return false;
+
+	return true;
+}
+
 static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
 					      struct device *parent,
 					      sector_t size,
@@ -2414,6 +2430,16 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
 		md->disk->flags |= GENHD_FL_NO_PART_SCAN
 				   | GENHD_FL_SUPPRESS_PARTITION_INFO;
 
+	/*
+	 * Some embedded devices store FS partition table on a boot eMMC
+	 * partition (NVIDIA Tegra for example).  In this case partition
+	 * scanner will scan the boot partitions, but the found partitions
+	 * won't be assigned to the boot block device.  It's up to a
+	 * partition scanner what to do with the found partitions.
+	 */
+	if (mmc_blk_boot_part_scan(md, card))
+		md->disk->flags |= GENHD_FL_PART_SCAN_ONCE;
+
 	/*
 	 * As discussed on lkml, GENHD_FL_REMOVABLE should:
 	 *
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index c318fb5b6a94..e3d47c7e9c48 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -468,6 +468,8 @@ struct mmc_host {
 	/* Host Software Queue support */
 	bool			hsq_enabled;
 
+	bool			scan_mmc_boot_partitions;
+
 	unsigned long		private[] ____cacheline_aligned;
 };
 
-- 
2.25.1
