From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [V3 PATCH 1/4] soc/tegra: fuse: export tegra_sku_info
Date: Tue, 2 Dec 2014 12:50:32 +0800
Message-ID: <1417495835-5556-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some Tegra drivers might be compiled as kernel modules, and they need the
fuse information for initialization. One example is the GK20A Nouveau
driver. It needs the GPU speedo value to calculate frequency-voltage
table. So export the tegra_sku_info.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

v3: fix subject and typo, add reviewers' Acked-by

v2: add more description why we need this patch

 drivers/soc/tegra/fuse/fuse-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 11a5043959dc..011a3363c265 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -31,6 +31,7 @@
 static u32 (*fuse_readl)(const unsigned int offset);
 static int fuse_size;
 struct tegra_sku_info tegra_sku_info;
+EXPORT_SYMBOL(tegra_sku_info);
 
 static const char *tegra_revision_name[TEGRA_REVISION_MAX] = {
 	[TEGRA_REVISION_UNKNOWN] = "unknown",
-- 
1.9.1
