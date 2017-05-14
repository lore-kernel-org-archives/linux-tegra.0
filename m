From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: Check whether page belongs to BO in tegra_bo_kmap()
Date: Sun, 14 May 2017 23:47:32 +0300
Message-ID: <20170514204734.22130-2-digetx@gmail.com>
References: <20170514204734.22130-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170514204734.22130-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This fixes an OOPS in case of out-of-bounds accessing of a kmap'ed commands
buffer CMA while patching relocations in do_relocs().

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 424569b53e57..b76d7ac75696 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -74,6 +74,9 @@ static void *tegra_bo_kmap(struct host1x_bo *bo, unsigned int page)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
+	if (page * PAGE_SIZE > obj->gem.size)
+		return NULL;
+
 	if (obj->vaddr)
 		return obj->vaddr + page * PAGE_SIZE;
 	else if (obj->gem.import_attach)
-- 
2.13.0
