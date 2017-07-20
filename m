From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: [PATCH 6/9] ARM: init: update secondary_data register documentation
Date: Thu, 20 Jul 2017 02:29:25 +0200
Message-ID: <a6e5e735ebae32a433e501188a86082efc8b0b52.1500510157.git.mirq-linux@rere.qmqm.pl>
References: <cover.1500510157.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1500510157.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Fix secondary_data pointer register and document other
occurrences in SMP boot code.

Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
---
 arch/arm/kernel/head.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index 04286fd9e09c..68b13db86bef 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -413,7 +413,7 @@ ENDPROC(secondary_startup)
 ENDPROC(secondary_startup_arm)
 
 	/*
-	 * r6  = &secondary_data
+	 * r7  = &secondary_data
 	 */
 ENTRY(__secondary_switched)
 	ldr	sp, [r7, #12]			@ get secondary_data.stack
@@ -443,6 +443,7 @@ __secondary_data:
  *  r2  = atags or dtb pointer
  *  r4  = TTBR pointer (low word)
  *  r5  = TTBR pointer (high word if LPAE)
+ *  r7  = secondary_data pointer (SMP)
  *  r9  = processor ID
  *  r13 = *virtual* address to jump to upon completion
  */
@@ -480,6 +481,7 @@ ENDPROC(__enable_mmu)
  *  r0  = cp#15 control register
  *  r1  = machine ID
  *  r2  = atags or dtb pointer
+ *  r7  = secondary_data pointer (SMP)
  *  r9  = processor ID
  *  r13 = *virtual* address to jump to upon completion
  *
-- 
2.11.0
