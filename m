From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: [PATCH 10/13] fbdev: allow apertures == NULL in
 remove_conflicting_framebuffers()
Date: Fri, 24 Nov 2017 18:53:33 +0100
Message-ID: <13240c59cafec988cdda37cc4d48252ff56f0d04.1511544782.git.mirq-linux@rere.qmqm.pl>
References: <cover.1511544782.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1511544782.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Interpret (otherwise-invalid) NULL apertures argument to mean all-memory
range. This will allow to remove several duplicates of this code from
drivers in following patches.

Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
---
 drivers/video/fbdev/core/fbmem.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 5ea980e5d3b7..927e016487e9 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1780,11 +1780,25 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 				    const char *name, bool primary)
 {
 	int ret;
+	bool do_free = false;
+
+	if (!a) {
+		a = alloc_apertures(1);
+		if (!a)
+			return -ENOMEM;
+
+		a->ranges[0].base = 0;
+		a->ranges[0].size = ~0;
+		do_free = true;
+	}
 
 	mutex_lock(&registration_lock);
 	ret = do_remove_conflicting_framebuffers(a, name, primary);
 	mutex_unlock(&registration_lock);
 
+	if (do_free)
+		kfree(a);
+
 	return ret;
 }
 EXPORT_SYMBOL(remove_conflicting_framebuffers);
-- 
2.11.0
