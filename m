From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 5/8] mmc: block: Add mmc_bdev_to_area_type() helper
Date: Fri,  6 Mar 2020 05:12:17 +0300
Message-ID: <20200306021220.22097-6-digetx@gmail.com>
References: <20200306021220.22097-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200306021220.22097-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra Partition Table parser needs to know eMMC partition type
in order to validate and parse partition table properly. This patch adds
new mmc_bdev_to_area_type() helper which takes block device for the input
and returns a corresponding MMC card partition type.

This allows tegra-partition parser to distinguish boot eMMC partition from
the main eMMC partition.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/core/block.c   | 16 ++++++++++++++++
 include/linux/mmc/blkdev.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 2cee57c7388d..ec69b613ee92 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -337,6 +337,22 @@ int mmc_bdev_to_part_type(struct block_device *bdev)
 	return md->part_type;
 }
 
+int mmc_bdev_to_area_type(struct block_device *bdev)
+{
+	struct mmc_blk_data *md;
+	struct mmc_card *card;
+
+	card = mmc_bdev_to_card(bdev);
+	if (!card)
+		return -EINVAL;
+
+	md = mmc_blk_get(bdev->bd_disk);
+	if (!md)
+		return -EINVAL;
+
+	return md->area_type;
+}
+
 static int mmc_blk_open(struct block_device *bdev, fmode_t mode)
 {
 	struct mmc_blk_data *md = mmc_blk_get(bdev->bd_disk);
diff --git a/include/linux/mmc/blkdev.h b/include/linux/mmc/blkdev.h
index 24e73ac02b4b..5fa5ef35ac25 100644
--- a/include/linux/mmc/blkdev.h
+++ b/include/linux/mmc/blkdev.h
@@ -10,5 +10,6 @@ struct mmc_card;
 
 struct mmc_card *mmc_bdev_to_card(struct block_device *bdev);
 int mmc_bdev_to_part_type(struct block_device *bdev);
+int mmc_bdev_to_area_type(struct block_device *bdev);
 
 #endif /* LINUX_MMC_BLOCK_DEVICE_H */
-- 
2.25.1
