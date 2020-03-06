From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 6/8] mmc: block: Add MMC_QUIRK_RESCAN_MAIN_BLKDEV
Date: Fri,  6 Mar 2020 05:12:18 +0300
Message-ID: <20200306021220.22097-7-digetx@gmail.com>
References: <20200306021220.22097-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200306021220.22097-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra Partition Table location isn't restricted by the main eMMC
partition. This patch introduces new MMC-card quirk which is needed by
some NVIDIA Tegra devices in order to set up partition table if it is
stored on a eMMC boot partition.

The tegra-partition parser will read out FS partition table from the eMMC
boot partition and stash it for the main eMMC partition. In this case
block device of the main eMMC partition needs to be re-scanned in order
to assign the stashed partition table to the main MMC block device by
tegra-partition parser.

This patch adds new MMC card flag that is applied by tegra-partition
parser to the scanned MMC card if partition table is found on a boot
eMMC partition. This flag tells MMC_BLOCK core that main MMC partition
needs to be re-scanned once all block devices of the MMC card are
instantiated.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/core/block.c | 31 +++++++++++++++++++++++++++++++
 include/linux/mmc/card.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index ec69b613ee92..2c2bec114fd6 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -2955,6 +2955,27 @@ static void mmc_blk_remove_debugfs(struct mmc_card *card,
 
 #endif /* CONFIG_DEBUG_FS */
 
+static int mmc_blk_rescan_disk(struct mmc_blk_data *md)
+{
+	struct block_device *bdev;
+
+	bdev = blkdev_get_by_dev(disk_devt(md->disk), FMODE_READ | FMODE_EXCL,
+				 md);
+	if (IS_ERR(bdev)) {
+		pr_err("%s: %s: failed to get block device\n",
+		       __func__, md->disk->disk_name);
+		return PTR_ERR(bdev);
+	}
+
+	mutex_lock(&bdev->bd_mutex);
+	bdev_disk_changed(bdev, false);
+	mutex_unlock(&bdev->bd_mutex);
+
+	blkdev_put(bdev, FMODE_READ | FMODE_EXCL);
+
+	return 0;
+}
+
 static int mmc_blk_probe(struct mmc_card *card)
 {
 	struct mmc_blk_data *md, *part_md;
@@ -2998,6 +3019,16 @@ static int mmc_blk_probe(struct mmc_card *card)
 			goto out;
 	}
 
+	/*
+	 * Quirk for NVIDIA Tegra devices that store FS partition table
+	 * on a boot partition.  Tegra-partition scanner found partition
+	 * table on a boot MMC partition and stashed it for the main MMC
+	 * partition if MMC_QUIRK_RESCAN_MAIN_BLKDEV is set, and thus,
+	 * the main partition needs to be re-scanned.
+	 */
+	if (card->quirks & MMC_QUIRK_RESCAN_MAIN_BLKDEV)
+		mmc_blk_rescan_disk(md);
+
 	/* Add two debugfs entries */
 	mmc_blk_add_debugfs(card, md);
 
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index 90b1d83ce675..550d50e57cc4 100644
--- a/include/linux/mmc/card.h
+++ b/include/linux/mmc/card.h
@@ -270,6 +270,7 @@ struct mmc_card {
 #define MMC_QUIRK_BROKEN_IRQ_POLLING	(1<<11)	/* Polling SDIO_CCCR_INTx could create a fake interrupt */
 #define MMC_QUIRK_TRIM_BROKEN	(1<<12)		/* Skip trim */
 #define MMC_QUIRK_BROKEN_HPI	(1<<13)		/* Disable broken HPI support */
+#define MMC_QUIRK_RESCAN_MAIN_BLKDEV	(1<<14)	/* Main partition needs to be re-scanned after instantiating all partitions */
 
 	bool			reenable_cmdq;	/* Re-enable Command Queue */
 
-- 
2.25.1
