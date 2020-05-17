From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 4/7] partitions/efi: Support GPT entry lookup at a non-standard location
Date: Sun, 17 May 2020 05:12:22 +0300
Message-ID: <20200517021225.22890-5-digetx@gmail.com>
References: <20200517021225.22890-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200517021225.22890-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Nils=20=C3=96stlund?= <nils-ElENwYY5mljQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve McIntyre <steve-nt0JYOx6u4DQT0dZR+AlfA@public.gmane.org>, linux-efi <linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
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

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 block/partitions/check.h | 1 +
 block/partitions/efi.c   | 9 +++++++++
 2 files changed, 10 insertions(+)

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
index b64bfdd4326c..34c25f708733 100644
--- a/block/partitions/efi.c
+++ b/block/partitions/efi.c
@@ -621,6 +621,15 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
         if (!good_agpt && force_gpt)
                 good_agpt = is_gpt_valid(state, lastlba, &agpt, &aptes);
 
+	/*
+	 * The force_gpt_sector is used by NVIDIA Tegra partition parser in
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
