From: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] Gpu: drm: tegra - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 10:23:45 +0530
Message-ID: <1485752025-29465-1-git-send-email-shailendra.v@samsung.com>
References: <CGME20170130045353epcas2p198210c8758d8a9d35fbfcfd8d24cc072@epcas2p1.samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.shailesh-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ashish.kalra-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shailendra Verma <shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

of_match_device could return NULL, and so can cause a NULL
pointer dereference later.

Signed-off-by: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 74d0540..34f032f 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2540,6 +2540,10 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	int err;
 
 	match = of_match_device(tegra_sor_of_match, &pdev->dev);
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
 
 	sor = devm_kzalloc(&pdev->dev, sizeof(*sor), GFP_KERNEL);
 	if (!sor)
-- 
1.7.9.5
