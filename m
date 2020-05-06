From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/2] memory: tegra: Drop <linux/clk-provider.h>
Date: Wed,  6 May 2020 14:32:36 +0200
Message-ID: <20200506123236.7463-3-geert+renesas@glider.be>
References: <20200506123236.7463-1-geert+renesas@glider.be>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200506123236.7463-1-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra EMC scaling support code is not a clock provider, but merely a
clock consumer, and thus does not need to include
<linux/clk-provider.h>.

Fixes: ec37a9a17afbfad5 ("memory: tegra: Add EMC scaling support code for Tegra210")
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/memory/tegra/tegra210-emc-core.c | 1 -
 drivers/memory/tegra/tegra210-emc.h      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index d64ffe27c2457c9e..cdd663ba4733d8ff 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -6,7 +6,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
-#include <linux/clk-provider.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
diff --git a/drivers/memory/tegra/tegra210-emc.h b/drivers/memory/tegra/tegra210-emc.h
index 63b3d0a790f1a908..8988bcf1529072a7 100644
--- a/drivers/memory/tegra/tegra210-emc.h
+++ b/drivers/memory/tegra/tegra210-emc.h
@@ -7,7 +7,6 @@
 #define TEGRA210_EMC_H
 
 #include <linux/clk.h>
-#include <linux/clk-provider.h>
 #include <linux/clk/tegra.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-- 
2.17.1
