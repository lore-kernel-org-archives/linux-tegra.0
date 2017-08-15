From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/10] drm/tegra: sor: Trace register accesses
Date: Tue, 15 Aug 2017 15:41:14 +0200
Message-ID: <20170815134114.17547-10-thierry.reding@gmail.com>
References: <20170815134114.17547-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815134114.17547-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add tracepoint events for SOR controller register accesses.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c   | 8 +++++++-
 drivers/gpu/drm/tegra/trace.h | 7 +++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 020792eb2724..04b3a50deab6 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -27,6 +27,7 @@
 #include "dc.h"
 #include "drm.h"
 #include "sor.h"
+#include "trace.h"
 
 #define SOR_REKEY 0x38
 
@@ -237,12 +238,17 @@ static inline struct tegra_sor *to_sor(struct tegra_output *output)
 
 static inline u32 tegra_sor_readl(struct tegra_sor *sor, unsigned int offset)
 {
-	return readl(sor->regs + (offset << 2));
+	u32 value = readl(sor->regs + (offset << 2));
+
+	trace_sor_readl(sor->dev, offset, value);
+
+	return value;
 }
 
 static inline void tegra_sor_writel(struct tegra_sor *sor, u32 value,
 				    unsigned int offset)
 {
+	trace_sor_writel(sor->dev, offset, value);
 	writel(value, sor->regs + (offset << 2));
 }
 
diff --git a/drivers/gpu/drm/tegra/trace.h b/drivers/gpu/drm/tegra/trace.h
index e497a0258ee4..e9b7cdad5c4c 100644
--- a/drivers/gpu/drm/tegra/trace.h
+++ b/drivers/gpu/drm/tegra/trace.h
@@ -52,6 +52,13 @@ DEFINE_EVENT(register_access, dpaux_readl,
 	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
 	TP_ARGS(dev, offset, value));
 
+DEFINE_EVENT(register_access, sor_writel,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+DEFINE_EVENT(register_access, sor_readl,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+
 #endif /* DRM_TEGRA_TRACE_H */
 
 /* This part must be outside protection */
-- 
2.13.3
