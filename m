From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] partitions/efi: Add 'gpt_sector' kernel cmdline parameter
Date: Wed, 19 Feb 2020 19:23:39 +0300
Message-ID: <20200219162339.16192-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>, Colin Cross <ccross@android.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>
Cc: linux-efi@vger.kernel.org, linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The gpt_sector=<sector> causes the GPT partition search to look at the
specified sector for a valid GPT header if the GPT is not found at the
beginning or the end of block device.

In particular this is needed for NVIDIA Tegra consumer-grade Android
devices in order to make them usable with the upstream kernel because
these devices use a proprietary / closed-source partition table format
for the EMMC and it's impossible to change the partition's format. Luckily
there is a GPT table in addition to the proprietary table, which is placed
in uncommon location of the EMMC storage and bootloader passes the
location to kernel using "gpt gpt_sector=<sector>" cmdline parameters.

This patch is based on the original work done by Colin Cross for the
downstream Android kernel.

Cc: Colin Cross <ccross@android.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 block/partitions/efi.c                          | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 50138e6826a1..ee4781daa379 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1382,6 +1382,11 @@
 			primary GPT is corrupted, it enables the backup/alternate
 			GPT to be used instead.
 
+	gpt_sector	[EFI] Forces GPT partition search to look at the
+			specified sector for a valid GPT header if the GPT is
+			not found at the beginning or the end of the block
+			device.
+
 	grcan.enable0=	[HW] Configuration of physical interface 0. Determines
 			the "Enable 0" bit of the configuration register.
 			Format: 0 | 1
diff --git a/block/partitions/efi.c b/block/partitions/efi.c
index db2fef7dfc47..0c8926d76d7a 100644
--- a/block/partitions/efi.c
+++ b/block/partitions/efi.c
@@ -103,6 +103,17 @@ force_gpt_fn(char *str)
 }
 __setup("gpt", force_gpt_fn);
 
+/* This allows a kernel command line option 'gpt_sector=<sector>' to
+ * enable GPT header lookup at a non-standard location.
+ */
+static u64 force_gpt_sector;
+static int __init
+force_gpt_sector_fn(char *str)
+{
+	WARN_ON(kstrtoull(str, 10, &force_gpt_sector) < 0);
+	return 1;
+}
+__setup("gpt_sector=", force_gpt_sector_fn);
 
 /**
  * efi_crc32() - EFI version of crc32 function
@@ -621,6 +632,10 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
         if (!good_agpt && force_gpt)
                 good_agpt = is_gpt_valid(state, lastlba, &agpt, &aptes);
 
+	if (!good_agpt && force_gpt && force_gpt_sector)
+		good_agpt = is_gpt_valid(state, force_gpt_sector,
+					 &agpt, &aptes);
+
         /* The obviously unsuccessful case */
         if (!good_pgpt && !good_agpt)
                 goto fail;
-- 
2.24.0
