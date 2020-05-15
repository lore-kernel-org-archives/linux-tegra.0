From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 4/6] partitions/efi: Support GPT entry lookup at a non-standard location
Date: Fri, 15 May 2020 04:41:41 +0300
Message-ID: <20200515014143.12984-5-digetx@gmail.com>
References: <20200515014143.12984-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200515014143.12984-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, =?UTF-8?q?Nils=20=C3=96stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Most of consumer-grade NVIDIA Tegra devices use a proprietary bootloader
that can't be easily replaced because it's locked down using Secure Boot
cryptography singing and the crypto keys aren't given to a device owner.
These devices usually have eMMC storage that is partitioned using a custom
NVIDIA Tegra partition table format.  Of course bootloader and other
"special things" are stored on the eMMC storage, and thus, the partition
format can't be changed.

The Tegra partition format has been reverse-engineered, but NVIDIA did
another odd thing by merging "boot" and "main" eMMC HW partitions into a
single virtual partition in theirs bootloader.  This is not supported by
Linux kernel and can't be easily implemented.  Hence partition table entry
isn't accessible by kernel if it's located at the "boot" eMMC partition.
Luckily this is a rare case in practice and even if it's the case, likely
that the proprietary bootloader will supply kernel with a non-standard
gpt_sector= cmdline option.  This gpt_sector= argument points at a GPT
entry that is placed at a non-standard location on the eMMC storage.

This patch allows to support the non-standard cmdline option for NVIDIA
Tegra devices without bothering any other platforms.  The force_gpt_sector
variable should be set before invoking efi_partition() and be unset after
the invocation completion.  This variable, if set, instructs GPT parser
to look up GPT entry at the given sector in addition to the standard GPT
locations.

This patch is based on the original work done by Colin Cross for the
downstream Android kernel.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 block/partitions/efi.c | 10 ++++++++++
 block/partitions/efi.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/block/partitions/efi.c b/block/partitions/efi.c
index b64bfdd4326c..48e4c2aeeded 100644
--- a/block/partitions/efi.c
+++ b/block/partitions/efi.c
@@ -103,6 +103,12 @@ force_gpt_fn(char *str)
 }
 __setup("gpt", force_gpt_fn);
 
+/* Used by NVIDIA Tegra partition parser in order to convey a non-standard
+ * location of the GPT entry for lookup. This variable should be set before
+ * efi_partition() invocation for instructing parser to look up GPT entry at
+ * the given sector, and it should be unset after completion of the invocation.
+ */
+sector_t force_gpt_sector;
 
 /**
  * efi_crc32() - EFI version of crc32 function
@@ -621,6 +627,10 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
         if (!good_agpt && force_gpt)
                 good_agpt = is_gpt_valid(state, lastlba, &agpt, &aptes);
 
+	if (!good_agpt && force_gpt && force_gpt_sector)
+		good_agpt = is_gpt_valid(state, force_gpt_sector,
+					 &agpt, &aptes);
+
         /* The obviously unsuccessful case */
         if (!good_pgpt && !good_agpt)
                 goto fail;
diff --git a/block/partitions/efi.h b/block/partitions/efi.h
index 8cc2b88d0aa8..630cf21439af 100644
--- a/block/partitions/efi.h
+++ b/block/partitions/efi.h
@@ -113,4 +113,6 @@ typedef struct _legacy_mbr {
 	__le16 signature;
 } __packed legacy_mbr;
 
+extern sector_t force_gpt_sector;
+
 #endif
-- 
2.26.0
