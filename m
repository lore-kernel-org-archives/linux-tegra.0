From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] host1x: export host1x_syncpt_incr_max function
Date: Wed, 19 Feb 2014 14:23:28 -0800
Message-ID: <1392848608-15056-1-git-send-email-cooloney@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra V4L2 camera driver needs this function to do frame capture.

Signed-off-by: Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/host1x.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 3af8472..d2b5299 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -136,6 +136,7 @@ u32 host1x_syncpt_id(struct host1x_syncpt *sp);
 u32 host1x_syncpt_read_min(struct host1x_syncpt *sp);
 u32 host1x_syncpt_read_max(struct host1x_syncpt *sp);
 int host1x_syncpt_incr(struct host1x_syncpt *sp);
+u32 host1x_syncpt_incr_max(struct host1x_syncpt *sp, u32 incrs);
 int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 		       u32 *value);
 struct host1x_syncpt *host1x_syncpt_request(struct device *dev,
-- 
1.8.3.2
