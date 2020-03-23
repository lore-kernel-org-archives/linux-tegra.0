From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 10/10] partitions/tegra: Implement eMMC boot partitions scanning
Date: Mon, 23 Mar 2020 19:34:31 +0300
Message-ID: <20200323163431.7678-11-digetx@gmail.com>
References: <20200323163431.7678-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200323163431.7678-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some NVIDIA Tegra devices store partition table on eMMC boot partition.
In order to support this case, the tegra-partition parser will read out
partition table from a boot partition and stash it for the main eMMC
partition.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 block/partitions/tegra.c | 122 +++++++++++++++++++++++++++++++++++----
 1 file changed, 111 insertions(+), 11 deletions(-)

diff --git a/block/partitions/tegra.c b/block/partitions/tegra.c
index 4cb8064bf458..09c300330f81 100644
--- a/block/partitions/tegra.c
+++ b/block/partitions/tegra.c
@@ -25,6 +25,7 @@
 #include <linux/mmc/blkdev.h>
 #include <linux/mmc/card.h>
 #include <linux/mmc/host.h>
+#include <linux/mmc/mmc.h>
 
 #include <soc/tegra/common.h>
 #include <soc/tegra/partition.h>
@@ -50,7 +51,10 @@
 struct tegra_partition_table_parser {
 	struct tegra_partition_table *pt;
 	struct parsed_partitions *state;
+	struct mmc_card *card;
 	bool pt_entry_checked;
+	unsigned int boot_id;
+	bool snapshot_mode;
 	sector_t sector;
 	int boot_offset;
 	u32 dev_instance;
@@ -67,6 +71,7 @@ struct tegra_partition_type {
 	char *name;
 };
 
+static struct tegra_partition_table *scratch_pt;
 static sector_t tegra_pt_sector_address;
 static sector_t tegra_pt_sectors_num;
 
@@ -224,6 +229,10 @@ static bool tegra_partition_valid(struct tegra_partition_table_parser *ptp,
 		return false;
 	}
 
+	/* size will be validated when ptp->snapshot_mode=false */
+	if (ptp->snapshot_mode && size)
+		return true;
+
 	sect_end = get_capacity(ptp->state->bdev->bd_disk);
 
 	/* eMMC boot partitions are below ptp->boot_offset */
@@ -254,6 +263,9 @@ static bool tegra_partitions_parse(struct tegra_partition_table_parser *ptp,
 	sector_t sector, size;
 	int i, slot = 1;
 
+	if (ptp->snapshot_mode && !check_only)
+		return true;
+
 	ptp->pt_entry_checked = false;
 
 	for (i = 0; i < pt->secure.num_partitions; i++) {
@@ -369,6 +381,7 @@ tegra_partition_table_emmc_boot_offset(struct tegra_partition_table_parser *ptp)
 {
 	struct mmc_card *card = mmc_bdev_to_card(ptp->state->bdev);
 	const struct of_device_id *matched;
+	int part_type, area_type;
 	const u32 *sdhci_bases;
 	u32 sdhci_base;
 	unsigned int i;
@@ -404,6 +417,32 @@ tegra_partition_table_emmc_boot_offset(struct tegra_partition_table_parser *ptp)
 	ptp->dev_id       = TEGRA_PT_SDHCI_DEVICE_ID;
 	ptp->dev_instance = i;
 
+	area_type = mmc_bdev_to_area_type(ptp->state->bdev);
+
+	if (WARN_ON(area_type < 0))
+		return -1;
+
+	switch (area_type) {
+	case MMC_BLK_DATA_AREA_BOOT:
+		part_type = mmc_bdev_to_part_type(ptp->state->bdev);
+
+		if (WARN_ON(part_type < 0))
+			return -1;
+
+		ptp->boot_id = part_type - EXT_CSD_PART_CONFIG_ACC_BOOT0;
+		ptp->snapshot_mode = true;
+		break;
+
+	case MMC_BLK_DATA_AREA_MAIN:
+		break;
+
+	default:
+		TEGRA_PT_ERR(ptp, "unexpected area_type: %u\n", area_type);
+		return -1;
+	}
+
+	ptp->card = card;
+
 	/*
 	 * eMMC storage has two special boot partitions in addition to the
 	 * main one.  NVIDIA's bootloader linearizes eMMC boot0->boot1->main
@@ -427,6 +466,9 @@ static int tegra_read_partition_table(struct tegra_partition_table_parser *ptp)
 	Sector sect;
 	void *part;
 
+	if (scratch_pt)
+		return 1;
+
 	for (i = 0; i < ARRAY_SIZE(ptu->pt_parts); i++) {
 		/*
 		 * Partition table takes at maximum 4096 bytes, but
@@ -462,18 +504,64 @@ int tegra_partition(struct parsed_partitions *state)
 	if (ptp.boot_offset < 0)
 		return 0;
 
-	if (tegra_pt_sector_address < ptp.boot_offset) {
-		TEGRA_PT_INFO(&ptp,
-			      "scanning eMMC boot partitions unimplemented\n");
-		return 0;
-	}
+	/*
+	 * Some devices store partition table on boot MMC partition.
+	 * In this case a "snapshot mode" will be used, which will
+	 * only read->check->store partition table, the stored table
+	 * will be used for the main MMC partition later on.
+	 */
+	if (ptp.snapshot_mode) {
+		sector_t boot_start, boot_end, boot_size;
 
-	ptp.pt = kmalloc(TEGRA_PT_LOGICAL_SECTOR_SIZE, GFP_KERNEL);
-	if (!ptp.pt)
-		return 0;
+		/* partition is already snapshoted, no need to proceed */
+		if (scratch_pt)
+			return 0;
+
+		boot_size  = ptp.boot_offset / MMC_NUM_BOOT_PARTITION;
+		boot_start = ptp.boot_id * boot_size;
+		boot_end   = boot_start + boot_size;
 
-	ptp.sector = tegra_pt_sector_address - ptp.boot_offset;
-	end_sector = ptp.sector + tegra_pt_sectors_num;
+		/*
+		 * Bail out if partition table isn't located here, at this MMC
+		 * partition.
+		 */
+		if (tegra_pt_sector_address < boot_start ||
+		    tegra_pt_sector_address >= boot_end)
+			return 0;
+
+		ptp.boot_offset = boot_start;
+
+		/*
+		 * Note that mmc_blk_probe() always registers boot partitions
+		 * after the main and we rely on this feature, otherwise
+		 * scratch_pt won't be released (although this is not a big
+		 * deal).
+		 */
+		ptp.pt = kmalloc(TEGRA_PT_LOGICAL_SECTOR_SIZE, GFP_KERNEL);
+		if (!ptp.pt)
+			return 0;
+
+		ptp.sector = tegra_pt_sector_address - ptp.boot_offset;
+		end_sector = ptp.sector + tegra_pt_sectors_num;
+
+	} else if (scratch_pt) {
+		TEGRA_PT_INFO(&ptp, "using stashed partition table\n");
+
+		ptp.pt     = scratch_pt;
+		ptp.sector = 0;
+		end_sector = 1;
+
+	} else {
+		if (tegra_pt_sector_address < ptp.boot_offset)
+			return 0;
+
+		ptp.pt = kmalloc(TEGRA_PT_LOGICAL_SECTOR_SIZE, GFP_KERNEL);
+		if (!ptp.pt)
+			return 0;
+
+		ptp.sector = tegra_pt_sector_address - ptp.boot_offset;
+		end_sector = ptp.sector + tegra_pt_sectors_num;
+	}
 
 	/*
 	 * Partition table is duplicated till the end_sector.
@@ -503,9 +591,21 @@ int tegra_partition(struct parsed_partitions *state)
 		ptp.sector += TEGRA_PT_SECTOR_SZ;
 	}
 
-	if (ret == 1)
+	if (ret == 1) {
+		if (ptp.snapshot_mode) {
+			ptp.card->quirks |= MMC_QUIRK_RESCAN_MAIN_BLKDEV;
+			scratch_pt = ptp.pt;
+
+			strlcat(state->pp_buf,
+				" stashed tegra-partition table\n", PAGE_SIZE);
+
+			return ret;
+		}
+
 		strlcat(state->pp_buf, "\n", PAGE_SIZE);
+	}
 
+	scratch_pt = NULL;
 	kfree(ptp.pt);
 
 	return ret;
-- 
2.25.1
