From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [REPOST V4 1/2] mfd: tps65090: Fix enum in header file
Date: Mon, 1 Apr 2013 18:20:23 -0400
Message-ID: <1364854824-7647-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The enum is missing the definition for the first bit, which makes all
the rest off by one. Add definition for the TPS65090_IRQ_INTERRUPT bit
which at 0.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v4:
 - no changes since v1

 include/linux/mfd/tps65090.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/tps65090.h b/include/linux/mfd/tps65090.h
index 998628a..3f43069 100644
--- a/include/linux/mfd/tps65090.h
+++ b/include/linux/mfd/tps65090.h
@@ -27,6 +27,7 @@
 
 /* TPS65090 IRQs */
 enum {
+	TPS65090_IRQ_INTERRUPT,
 	TPS65090_IRQ_VAC_STATUS_CHANGE,
 	TPS65090_IRQ_VSYS_STATUS_CHANGE,
 	TPS65090_IRQ_BAT_STATUS_CHANGE,
-- 
1.7.9.5
