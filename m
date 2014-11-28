From: Vince Hsu <vinceh@nvidia.com>
Subject: [PATCH] soc/tegra: fuse: export tegra_sku_info for module use
Date: Fri, 28 Nov 2014 16:16:13 +0800
Message-ID: <1417162573-19155-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, pdeschrijver@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Vince Hsu <vinceh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Vince Hsu <vinceh@nvidia.com>
---
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
