From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 5/6] partitions/tegra: Support enforced GPT scanning
Date: Sat, 16 May 2020 18:36:43 +0300
Message-ID: <20200516153644.13748-6-digetx@gmail.com>
References: <20200516153644.13748-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200516153644.13748-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Nils=20=C3=96stlund?= <nils-ElENwYY5mljQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve McIntyre <steve-nt0JYOx6u4DQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-efi <linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Downstream NVIDIA bootloader provides gpt_sector=<sector> kernel command
line option to the kernel. This option should instruct the GPT partition
parser to look at the specified sector for a valid GPT header if the GPT
is not found at the beginning or the end of a block device. Support of
this feature is needed by Tegra-based devices that have TegraPT and GPT
placed in inaccessible by kernel locations.  The GPT entry duplicates
TegraPT partitions.

Secondly, some Tegra-based devices have bootloader that enforces the GPT
scanning of the backup/alternative GPT entry by providing "gpt" cmdline
option to the kernel, but doesn't provide the "gpt_sector" option.
In this case GPT entry resides at a special offset from the end of eMMC
storage.  It is a common situation for older bootloader versions.

The offset is calculated as a total number of eMMC sectors minus number of
eMMC boot sectors minus 1.  This equation is explicitly defined and used
by the downstream Tegra kernels for locating GPT entry.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 block/partitions/check.h |  1 +
 block/partitions/core.c  |  1 +
 block/partitions/efi.c   |  6 +++++
 block/partitions/tegra.c | 57 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/block/partitions/check.h b/block/partitions/check.h
index 55acf6340e5b..1ce445d1c7f0 100644
--- a/block/partitions/check.h
+++ b/block/partitions/check.h
@@ -68,5 +68,6 @@ int osf_partition(struct parsed_partitions *state);
 int sgi_partition(struct parsed_partitions *state);
 int sun_partition(struct parsed_partitions *state);
 int sysv68_partition(struct parsed_partitions *state);
+int tegra_partition_forced_gpt(struct parsed_partitions *state);
 int tegra_partition(struct parsed_partitions *state);
 int ultrix_partition(struct parsed_partitions *state);
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 0b4720372f07..1931647d9742 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -83,6 +83,7 @@ static int (*check_part[])(struct parsed_partitions *) = {
 	sysv68_partition,
 #endif
 #ifdef CONFIG_TEGRA_PARTITION
+	tegra_partition_forced_gpt,
 	tegra_partition,
 #endif
 	NULL
diff --git a/block/partitions/efi.c b/block/partitions/efi.c
index 3af4660bc11f..4eb4496fbb1b 100644
--- a/block/partitions/efi.c
+++ b/block/partitions/efi.c
@@ -98,6 +98,12 @@ static int force_gpt;
 static int __init
 force_gpt_fn(char *str)
 {
+	/* This check allows to parse "gpt gpt_sector=" properly since
+	 * "gpt" overlaps with "gpt_sector", see tegra_gpt_sector_fn().
+	 */
+	if (force_gpt)
+		return 0;
+
 	force_gpt = 1;
 	return 1;
 }
diff --git a/block/partitions/tegra.c b/block/partitions/tegra.c
index d3a00ade145a..831dedb9a11c 100644
--- a/block/partitions/tegra.c
+++ b/block/partitions/tegra.c
@@ -565,3 +565,60 @@ int tegra_partition(struct parsed_partitions *state)
 
 	return ret;
 }
+
+/*
+ * This allows a kernel command line option 'gpt_sector=<sector>' to
+ * enable GPT header lookup at a non-standard location. This option
+ * is provided to kernel by NVIDIA's proprietary bootloader.
+ */
+static sector_t tegra_gpt_sector;
+static int __init tegra_gpt_sector_fn(char *str)
+{
+	WARN_ON(kstrtoull(str, 10, &tegra_gpt_sector) < 0);
+	return 1;
+}
+__setup("gpt_sector=", tegra_gpt_sector_fn);
+
+int tegra_partition_forced_gpt(struct parsed_partitions *state)
+{
+	int ret = 0;
+
+#ifdef CONFIG_EFI_PARTITION
+	struct tegra_partition_table_parser ptp = {};
+
+	if (!soc_is_tegra() || !tegra_boot_sdmmc)
+		return 0;
+
+	ptp.state = state;
+
+	ptp.boot_offset = tegra_partition_table_emmc_boot_offset(&ptp);
+	if (ptp.boot_offset < 0)
+		return 0;
+
+	/*
+	 * Some Tegra devices do not use gpt_sector=<sector> kernel command
+	 * line option. In this case these devices usually have a GPT entry
+	 * at the end of the block device and the GPT entry address is
+	 * calculated this way for eMMC:
+	 *
+	 * gpt_sector = ext_csd.sectors_num - ext_csd.boot_sectors_num - 1
+	 *
+	 * This algorithm is defined and used by NVIDIA in the downstream
+	 * kernel of those devices.
+	 *
+	 * Please note that bootloader supplies the "gpt" cmdline option
+	 * which enforces the GPT scanning, meaning that the scanning will
+	 * be a NO-OP on devices that do not use GPT.
+	 */
+	if (tegra_gpt_sector) {
+		state->force_gpt_sector = tegra_gpt_sector;
+	} else {
+		state->force_gpt_sector  = get_capacity(state->bdev->bd_disk);
+		state->force_gpt_sector -= ptp.boot_offset + 1;
+	}
+
+	ret = efi_partition(state);
+	state->force_gpt_sector = 0;
+#endif
+	return ret;
+}
-- 
2.26.0
