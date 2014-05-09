From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drm/gk20a/fb: fix NULL dereference
Date: Fri, 9 May 2014 16:57:48 +0900
Message-ID: <1399622268-16940-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

gk20a_ram_put() can be called with a NULL nouveau_mem in case of error.
Handle that case the way is it done in other RAM drivers.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
index 403c88f07b99..7effd1a63458 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
@@ -36,6 +36,8 @@ gk20a_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
 	int i;
 
 	*pmem = NULL;
+	if (unlikely(mem == NULL))
+		return;
 
 	for (i = 0; i < mem->size; i++) {
 		struct page *page;
-- 
1.9.2
