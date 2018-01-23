From: =?UTF-8?q?Christopher=20D=C3=ADaz=20Riveros?= <chrisadr-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH-next] drm/tegra: gem: Use PTR_ERR_OR_ZERO
Date: Tue, 23 Jan 2018 15:29:22 -0500
Message-ID: <20180123202922.14334-1-chrisadr@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

This issue was detected by using the Coccinelle software.

Signed-off-by: Christopher Díaz Riveros <chrisadr-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 drivers/gpu/drm/tegra/gem.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 49b9bf28f872..36c4ecc33e1a 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -416,10 +416,7 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
 					 &args->handle);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(bo);
 }
 
 static int tegra_bo_fault(struct vm_fault *vmf)
-- 
2.16.0
