From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 5/6] partitions/tegra: Support gpt_sector= command line option
Date: Fri, 15 May 2020 04:41:42 +0300
Message-ID: <20200515014143.12984-6-digetx@gmail.com>
References: <20200515014143.12984-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200515014143.12984-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, =?UTF-8?q?Nils=20=C3=96stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

The gpt_sector=<sector> causes the GPT partition parser to look at the
specified sector for a valid GPT header if the GPT is not found at the
beginning or the end of a block device.  This is needed by Tegra-based
devices that have TegraPT and GPT placed in inaccessible by kernel
locations.  The GPT entry duplicates TegraPT partitions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 block/partitions/check.h |  1 +
 block/partitions/core.c  |  1 +
 block/partitions/efi.c   |  6 ++++++
 block/partitions/tegra.c | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/block/partitions/check.h b/block/partitions/check.h
index ffa01cc4b0b0..ff07435b3ac3 100644
--- a/block/partitions/check.h
+++ b/block/partitions/check.h
@@ -67,5 +67,6 @@ int osf_partition(struct parsed_partitions *state);
 int sgi_partition(struct parsed_partitions *state);
 int sun_partition(struct parsed_partitions *state);
 int sysv68_partition(struct parsed_partitions *state);
+int tegra_partition_gpt(struct parsed_partitions *state);
 int tegra_partition(struct parsed_partitions *state);
 int ultrix_partition(struct parsed_partitions *state);
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 0b4720372f07..ece70f15f24d 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -83,6 +83,7 @@ static int (*check_part[])(struct parsed_partitions *) = {
 	sysv68_partition,
 #endif
 #ifdef CONFIG_TEGRA_PARTITION
+	tegra_partition_gpt,
 	tegra_partition,
 #endif
 	NULL
diff --git a/block/partitions/efi.c b/block/partitions/efi.c
index 48e4c2aeeded..f3b26be2bd6e 100644
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
index d1b84fff362c..c2dae0f32c2a 100644
--- a/block/partitions/tegra.c
+++ b/block/partitions/tegra.c
@@ -30,6 +30,7 @@
 #include <soc/tegra/common.h>
 #include <soc/tegra/partition.h>
 
+#include "efi.h"
 #include "check.h"
 
 #define TEGRA_PT_SECTOR_SIZE(ptp)	((ptp)->logical_sector_size / SZ_512)
@@ -563,3 +564,40 @@ int tegra_partition(struct parsed_partitions *state)
 
 	return ret;
 }
+
+/*
+ * This allows a kernel command line option 'gpt_sector=<sector>' to
+ * enable GPT header lookup at a non-standard location. This option
+ * is given to kernel by a proprietary bootloader, which is used by
+ * *most* (but not all) of NVIDIA Tegra-based devices.
+ */
+static sector_t tegra_gpt_sector;
+static int __init tegra_gpt_sector_fn(char *str)
+{
+	WARN_ON(kstrtoull(str, 10, &tegra_gpt_sector) < 0);
+	return 1;
+}
+__setup("gpt_sector=", tegra_gpt_sector_fn);
+
+int tegra_partition_gpt(struct parsed_partitions *state)
+{
+	int ret = 0;
+
+#ifdef CONFIG_EFI_PARTITION
+	struct tegra_partition_table_parser ptp = {};
+
+	if (!soc_is_tegra() || !tegra_boot_sdmmc || !tegra_gpt_sector)
+		return 0;
+
+	ptp.state = state;
+
+	ptp.boot_offset = tegra_partition_table_emmc_boot_offset(&ptp);
+	if (ptp.boot_offset < 0)
+		return 0;
+
+	force_gpt_sector = tegra_gpt_sector;
+	ret = efi_partition(ptp.state);
+	force_gpt_sector = 0;
+#endif
+	return ret;
+}
-- 
2.26.0
