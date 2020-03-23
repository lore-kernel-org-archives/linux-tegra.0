From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 04/10] block: Introduce GENHD_FL_PART_SCAN_ONCE
Date: Mon, 23 Mar 2020 19:34:25 +0300
Message-ID: <20200323163431.7678-5-digetx@gmail.com>
References: <20200323163431.7678-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20200323163431.7678-1-digetx@gmail.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Some NVIDIA Tegra devices store partition table on a boot eMMC partition,
and thus, partition-scanner should read out partition table from the boot
block device without assigning found partitions to the block device. The
new disk flag allows MMC core to enable boot partitions scanning, without
changing the old behavior.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 block/genhd.c             |  2 +-
 block/partition-generic.c | 13 ++++++++++++-
 include/linux/genhd.h     | 12 ++++++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index b210c12c4870..e66a8fcc963b 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -700,7 +700,7 @@ static void register_disk(struct device *parent, struct gendisk *disk,
 	}
 
 	/* No minors to use for partitions */
-	if (!disk_part_scan_enabled(disk))
+	if (!disk_part_scan_enabled(disk) && !disk_part_scan_once(disk))
 		goto exit;
 
 	/* No such device (e.g., media were just removed) */
diff --git a/block/partition-generic.c b/block/partition-generic.c
index 564fae77711d..bd31b71f49f7 100644
--- a/block/partition-generic.c
+++ b/block/partition-generic.c
@@ -537,7 +537,7 @@ int blk_add_partitions(struct gendisk *disk, struct block_device *bdev)
 	struct parsed_partitions *state;
 	int ret = -EAGAIN, p, highest;
 
-	if (!disk_part_scan_enabled(disk))
+	if (!disk_part_scan_enabled(disk) && !disk_part_scan_once(disk))
 		return 0;
 
 	state = check_partition(disk, bdev);
@@ -580,6 +580,17 @@ int blk_add_partitions(struct gendisk *disk, struct block_device *bdev)
 			goto out_free_state;
 	}
 
+	/*
+	 * Partitions were found, but they should stay inactive for a
+	 * scan-only disk.
+	 */
+	if (disk_part_scan_once(disk)) {
+		pr_warn("%s: ignoring partition table on scan-only block device\n",
+			disk->disk_name);
+		ret = 0;
+		goto out_free_state;
+	}
+
 	/* tell userspace that the media / partition table may have changed */
 	kobject_uevent(&disk_to_dev(disk)->kobj, KOBJ_CHANGE);
 
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index d5c75df64bba..79831481142f 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -179,6 +179,12 @@ struct hd_struct {
  * Implies ``GENHD_FL_SUPPRESS_PARTITION_INFO`` and
  * ``GENHD_FL_NO_PART_SCAN``.
  * Used for multipath devices.
+ *
+ * ``GENHD_FL_PART_SCAN_ONCE`` (0x0800): the block device will be scanned for
+ * partition table presence, but found partition won't be assigned to the
+ * block device.
+ * Used for embedded devices with a non-standard partition table, where
+ * partition table is stored on a separate block device.
  */
 #define GENHD_FL_REMOVABLE			0x0001
 /* 2 is unused (used to be GENHD_FL_DRIVERFS) */
@@ -191,6 +197,7 @@ struct hd_struct {
 #define GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE	0x0100
 #define GENHD_FL_NO_PART_SCAN			0x0200
 #define GENHD_FL_HIDDEN				0x0400
+#define GENHD_FL_PART_SCAN_ONCE			0x0800
 
 enum {
 	DISK_EVENT_MEDIA_CHANGE			= 1 << 0, /* media changed */
@@ -292,6 +299,11 @@ static inline bool disk_part_scan_enabled(struct gendisk *disk)
 		!(disk->flags & GENHD_FL_NO_PART_SCAN);
 }
 
+static inline bool disk_part_scan_once(struct gendisk *disk)
+{
+	return !!(disk->flags & GENHD_FL_PART_SCAN_ONCE);
+}
+
 static inline dev_t disk_devt(struct gendisk *disk)
 {
 	return MKDEV(disk->major, disk->first_minor);
-- 
2.25.1
