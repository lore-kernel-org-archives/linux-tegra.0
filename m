From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] gpu: host1x: Fix potential out-of-bounds access
Date: Thu,  9 Mar 2017 20:04:57 +0100
Message-ID: <20170309190457.4592-3-thierry.reding@gmail.com>
References: <20170309190457.4592-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170309190457.4592-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The check for valid syncpoint IDs is off by one. While at it, rewrite
the check to make it more easily understandable.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/syncpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 25c11a85050b..0ac026cdc30c 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -484,7 +484,7 @@ unsigned int host1x_syncpt_nb_mlocks(struct host1x *host)
 
 struct host1x_syncpt *host1x_syncpt_get(struct host1x *host, unsigned int id)
 {
-	if (host->info->nb_pts < id)
+	if (id >= host->info->nb_pts)
 		return NULL;
 
 	return host->syncpt + id;
-- 
2.12.0
