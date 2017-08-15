From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/10] drm/tegra: hdmi: Trace register accesses
Date: Tue, 15 Aug 2017 15:41:11 +0200
Message-ID: <20170815134114.17547-7-thierry.reding@gmail.com>
References: <20170815134114.17547-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815134114.17547-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add tracepoint events for HDMI controller register accesses.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/hdmi.c  | 8 +++++++-
 drivers/gpu/drm/tegra/trace.h | 7 +++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index aa7525619f3e..5b9d83b71943 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -24,6 +24,7 @@
 #include "hdmi.h"
 #include "drm.h"
 #include "dc.h"
+#include "trace.h"
 
 #define HDMI_ELD_BUFFER_SIZE 96
 
@@ -102,12 +103,17 @@ enum {
 static inline u32 tegra_hdmi_readl(struct tegra_hdmi *hdmi,
 				   unsigned int offset)
 {
-	return readl(hdmi->regs + (offset << 2));
+	u32 value = readl(hdmi->regs + (offset << 2));
+
+	trace_hdmi_readl(hdmi->dev, offset, value);
+
+	return value;
 }
 
 static inline void tegra_hdmi_writel(struct tegra_hdmi *hdmi, u32 value,
 				     unsigned int offset)
 {
+	trace_hdmi_writel(hdmi->dev, offset, value);
 	writel(value, hdmi->regs + (offset << 2));
 }
 
diff --git a/drivers/gpu/drm/tegra/trace.h b/drivers/gpu/drm/tegra/trace.h
index b32d90c967e8..e5c2e431c101 100644
--- a/drivers/gpu/drm/tegra/trace.h
+++ b/drivers/gpu/drm/tegra/trace.h
@@ -31,6 +31,13 @@ DEFINE_EVENT(register_access, dc_readl,
 	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
 	TP_ARGS(dev, offset, value));
 
+DEFINE_EVENT(register_access, hdmi_writel,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+DEFINE_EVENT(register_access, hdmi_readl,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+
 #endif /* DRM_TEGRA_TRACE_H */
 
 /* This part must be outside protection */
-- 
2.13.3
