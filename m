From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 4/6] partitions/efi: Support GPT entry lookup at a non-standard location
Date: Sat, 16 May 2020 18:36:42 +0300
Message-ID: <20200516153644.13748-5-digetx@gmail.com>
References: <20200516153644.13748-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-block-owner@vger.kernel.org>
In-Reply-To: <20200516153644.13748-1-digetx@gmail.com>
Sender: linux-block-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, =?UTF-8?q?Nils=20=C3=96stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Steve McIntyre <steve@einval.com>, Randy Dunlap <rdunlap@infradead.org>, linux-efi <linux-efi@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Most of consumer-grade NVIDIA Tegra devices use a proprietary bootloader
that can't be easily replaced because it's locked down using Secure Boot
cryptography signing and the crypto keys aren't given to a device owner.
These devices usually have eMMC storage that is partitioned using a custom
NVIDIA Tegra partition table format.  Of course bootloader and other
"special things" are stored on the eMMC storage, and thus, the partition
format can't be changed.

The Tegra partition format has been reverse-engineered, but NVIDIA uses
a virtually merged "boot" and "main" eMMC HW partitions in theirs
bootloader. This is not supported by Linux kernel and can't be easily
implemented. Hence partition table entry isn't accessible by kernel if
it's located at the "boot" eMMC partition. Luckily this is a rare case in
practice and even if it's the case, likely that the proprietary bootloader
will supply kernel with a non-standard gpt_sector= cmdline option.  This
gpt_sector= argument points at a GPT entry which resides at a non-standard
location on the eMMC storage.

This patch allows to support the non-standard cmdline option for NVIDIA
Tegra devices without bothering any other platforms.  The force_gpt_sector
parser-state struct member should be set before invoking efi_partition()
and it should be unset after the invocation completion.  This new parser
member instructs GPT parser to look up GPT entry at the given sector if
state->force_gpt_sector != 0.

This patch is based on the original work done by Colin Cross for the
downstream Android kernel.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 block/partitions/check.h | 1 +
 block/partitions/efi.c   | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/block/partitions/check.h b/block/partitions/check.h
index ffa01cc4b0b0..55acf6340e5b 100644
--- a/block/partitions/check.h
+++ b/block/partitions/check.h
@@ -22,6 +22,7 @@ struct parsed_partitions {
 	int limit;
 	bool access_beyond_eod;
 	char *pp_buf;
+	sector_t force_gpt_sector;
 };
 
 typedef struct {
diff --git a/block/partitions/efi.c b/block/partitions/efi.c
index b64bfdd4326c..3af4660bc11f 100644
--- a/block/partitions/efi.c
+++ b/block/partitions/efi.c
@@ -621,6 +621,14 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
         if (!good_agpt && force_gpt)
                 good_agpt = is_gpt_valid(state, lastlba, &agpt, &aptes);
 
+	/* The force_gpt_sector is used by NVIDIA Tegra partition parser in
+	 * order to convey a non-standard location of the GPT entry for lookup.
+	 * By default force_gpt_sector is set to 0 and has no effect.
+	 */
+	if (!good_agpt && force_gpt && state->force_gpt_sector)
+		good_agpt = is_gpt_valid(state, state->force_gpt_sector,
+					 &agpt, &aptes);
+
         /* The obviously unsuccessful case */
         if (!good_pgpt && !good_agpt)
                 goto fail;
-- 
2.26.0
