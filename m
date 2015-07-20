From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: dpaux: Fix transfers larger than 4 bytes
Date: Mon, 20 Jul 2015 08:49:38 +0200
Message-ID: <1437374978-1330-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steev Klimaszewski <threeway-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The DPAUX read/write FIFO registers aren't sequential in the register
space, causing transfers larger than 4 bytes to cause accesses to non-
existing FIFO registers.

Fixes: 6b6b604215c6 ("drm/tegra: Add eDP support")
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dpaux.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index d6b55e3e3716..a43a836e6f88 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -72,34 +72,32 @@ static inline void tegra_dpaux_writel(struct tegra_dpaux *dpaux,
 static void tegra_dpaux_write_fifo(struct tegra_dpaux *dpaux, const u8 *buffer,
 				   size_t size)
 {
-	unsigned long offset = DPAUX_DP_AUXDATA_WRITE(0);
 	size_t i, j;
 
-	for (i = 0; i < size; i += 4) {
-		size_t num = min_t(size_t, size - i, 4);
+	for (i = 0; i < DIV_ROUND_UP(size, 4); i++) {
+		size_t num = min_t(size_t, size - i * 4, 4);
 		unsigned long value = 0;
 
 		for (j = 0; j < num; j++)
-			value |= buffer[i + j] << (j * 8);
+			value |= buffer[i * 4 + j] << (j * 8);
 
-		tegra_dpaux_writel(dpaux, value, offset++);
+		tegra_dpaux_writel(dpaux, value, DPAUX_DP_AUXDATA_WRITE(i));
 	}
 }
 
 static void tegra_dpaux_read_fifo(struct tegra_dpaux *dpaux, u8 *buffer,
 				  size_t size)
 {
-	unsigned long offset = DPAUX_DP_AUXDATA_READ(0);
 	size_t i, j;
 
-	for (i = 0; i < size; i += 4) {
-		size_t num = min_t(size_t, size - i, 4);
+	for (i = 0; i < DIV_ROUND_UP(size, 4); i++) {
+		size_t num = min_t(size_t, size - i * 4, 4);
 		unsigned long value;
 
-		value = tegra_dpaux_readl(dpaux, offset++);
+		value = tegra_dpaux_readl(dpaux, DPAUX_DP_AUXDATA_READ(i));
 
 		for (j = 0; j < num; j++)
-			buffer[i + j] = value >> (j * 8);
+			buffer[i * 4 + j] = value >> (j * 8);
 	}
 }
 
-- 
2.4.5
