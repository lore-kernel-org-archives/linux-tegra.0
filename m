From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/10] drm/tegra: dpaux: Trace register accesses
Date: Tue, 15 Aug 2017 15:41:13 +0200
Message-ID: <20170815134114.17547-9-thierry.reding@gmail.com>
References: <20170815134114.17547-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815134114.17547-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add tracepoint events for DPAUX controller register accesses.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dpaux.c | 8 +++++++-
 drivers/gpu/drm/tegra/trace.h | 7 +++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 793cb4ad99c4..d476ab5006bb 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -25,6 +25,7 @@
 
 #include "dpaux.h"
 #include "drm.h"
+#include "trace.h"
 
 static DEFINE_MUTEX(dpaux_lock);
 static LIST_HEAD(dpaux_list);
@@ -67,12 +68,17 @@ static inline struct tegra_dpaux *work_to_dpaux(struct work_struct *work)
 static inline u32 tegra_dpaux_readl(struct tegra_dpaux *dpaux,
 				    unsigned int offset)
 {
-	return readl(dpaux->regs + (offset << 2));
+	u32 value = readl(dpaux->regs + (offset << 2));
+
+	trace_dpaux_readl(dpaux->dev, offset, value);
+
+	return value;
 }
 
 static inline void tegra_dpaux_writel(struct tegra_dpaux *dpaux,
 				      u32 value, unsigned int offset)
 {
+	trace_dpaux_writel(dpaux->dev, offset, value);
 	writel(value, dpaux->regs + (offset << 2));
 }
 
diff --git a/drivers/gpu/drm/tegra/trace.h b/drivers/gpu/drm/tegra/trace.h
index dd0176ff81eb..e497a0258ee4 100644
--- a/drivers/gpu/drm/tegra/trace.h
+++ b/drivers/gpu/drm/tegra/trace.h
@@ -45,6 +45,13 @@ DEFINE_EVENT(register_access, dsi_readl,
 	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
 	TP_ARGS(dev, offset, value));
 
+DEFINE_EVENT(register_access, dpaux_writel,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+DEFINE_EVENT(register_access, dpaux_readl,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+
 #endif /* DRM_TEGRA_TRACE_H */
 
 /* This part must be outside protection */
-- 
2.13.3
