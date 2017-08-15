From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/10] drm/tegra: dsi: Trace register accesses
Date: Tue, 15 Aug 2017 15:41:12 +0200
Message-ID: <20170815134114.17547-8-thierry.reding@gmail.com>
References: <20170815134114.17547-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815134114.17547-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add tracepoint events for DSI controller register accesses.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dsi.c   | 8 +++++++-
 drivers/gpu/drm/tegra/trace.h | 7 +++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 37a921cb676c..046649ec9441 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -28,6 +28,7 @@
 #include "drm.h"
 #include "dsi.h"
 #include "mipi-phy.h"
+#include "trace.h"
 
 struct tegra_dsi_state {
 	struct drm_connector_state base;
@@ -107,12 +108,17 @@ static struct tegra_dsi_state *tegra_dsi_get_state(struct tegra_dsi *dsi)
 
 static inline u32 tegra_dsi_readl(struct tegra_dsi *dsi, unsigned int offset)
 {
-	return readl(dsi->regs + (offset << 2));
+	u32 value = readl(dsi->regs + (offset << 2));
+
+	trace_dsi_readl(dsi->dev, offset, value);
+
+	return value;
 }
 
 static inline void tegra_dsi_writel(struct tegra_dsi *dsi, u32 value,
 				    unsigned int offset)
 {
+	trace_dsi_writel(dsi->dev, offset, value);
 	writel(value, dsi->regs + (offset << 2));
 }
 
diff --git a/drivers/gpu/drm/tegra/trace.h b/drivers/gpu/drm/tegra/trace.h
index e5c2e431c101..dd0176ff81eb 100644
--- a/drivers/gpu/drm/tegra/trace.h
+++ b/drivers/gpu/drm/tegra/trace.h
@@ -38,6 +38,13 @@ DEFINE_EVENT(register_access, hdmi_readl,
 	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
 	TP_ARGS(dev, offset, value));
 
+DEFINE_EVENT(register_access, dsi_writel,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+DEFINE_EVENT(register_access, dsi_readl,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+
 #endif /* DRM_TEGRA_TRACE_H */
 
 /* This part must be outside protection */
-- 
2.13.3
