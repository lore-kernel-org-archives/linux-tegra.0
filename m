From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drm/ttm: recognize ARM64 arch in ioprot handler
Date: Wed, 1 Jul 2015 17:32:29 +0900
Message-ID: <1435739549-18363-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Return proper pgprot for ARM64. This is required for objects like
Nouveau fences to be mapped with expected coherency.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 882cccdad272..ac6fe40b99f7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -490,7 +490,8 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp)
 	else if (boot_cpu_data.x86 > 3)
 		tmp = pgprot_noncached(tmp);
 #endif
-#if defined(__ia64__) || defined(__arm__) || defined(__powerpc__)
+#if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
+    defined(__powerpc__)
 	if (caching_flags & TTM_PL_FLAG_WC)
 		tmp = pgprot_writecombine(tmp);
 	else
-- 
2.4.4
