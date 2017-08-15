From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/10] drm/tegra: dc: Trace register accesses
Date: Tue, 15 Aug 2017 15:41:10 +0200
Message-ID: <20170815134114.17547-6-thierry.reding@gmail.com>
References: <20170815134114.17547-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815134114.17547-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add tracepoint events for display controller register accesses.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/Makefile |  2 ++
 drivers/gpu/drm/tegra/dc.h     |  8 +++++++-
 drivers/gpu/drm/tegra/trace.c  |  2 ++
 drivers/gpu/drm/tegra/trace.h  | 40 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tegra/trace.c
 create mode 100644 drivers/gpu/drm/tegra/trace.h

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index d472006159b7..258c3fde3ea4 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -24,4 +24,6 @@ tegra-drm-$(CONFIG_ARCH_TEGRA_186_SOC) += \
 	parker/dsi.o \
 	parker/sor.o
 
+tegra-drm-y += trace.o
+
 obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 63461eb769f0..ed61e35971f8 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -15,6 +15,7 @@
 #include <drm/drm_crtc.h>
 
 #include "drm.h"
+#include "trace.h"
 
 struct tegra_dc_soc_info;
 struct tegra_output;
@@ -72,12 +73,17 @@ static inline struct tegra_dc *to_tegra_dc(struct drm_crtc *crtc)
 static inline void tegra_dc_writel(struct tegra_dc *dc, u32 value,
 				   unsigned int offset)
 {
+	trace_dc_writel(dc->dev, offset, value);
 	writel(value, dc->regs + (offset << 2));
 }
 
 static inline u32 tegra_dc_readl(struct tegra_dc *dc, unsigned int offset)
 {
-	return readl(dc->regs + (offset << 2));
+	u32 value = readl(dc->regs + (offset << 2));
+
+	trace_dc_readl(dc->dev, offset, value);
+
+	return value;
 }
 
 struct tegra_dc_window {
diff --git a/drivers/gpu/drm/tegra/trace.c b/drivers/gpu/drm/tegra/trace.c
new file mode 100644
index 000000000000..006f65c72a34
--- /dev/null
+++ b/drivers/gpu/drm/tegra/trace.c
@@ -0,0 +1,2 @@
+#define CREATE_TRACE_POINTS
+#include "trace.h"
diff --git a/drivers/gpu/drm/tegra/trace.h b/drivers/gpu/drm/tegra/trace.h
new file mode 100644
index 000000000000..b32d90c967e8
--- /dev/null
+++ b/drivers/gpu/drm/tegra/trace.h
@@ -0,0 +1,40 @@
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM tegra
+
+#if !defined(DRM_TEGRA_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define DRM_TEGRA_TRACE_H 1
+
+#include <linux/device.h>
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(register_access,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value),
+	TP_STRUCT__entry(
+		__field(struct device *, dev)
+		__field(unsigned int, offset)
+		__field(u32, value)
+	),
+	TP_fast_assign(
+		__entry->dev = dev;
+		__entry->offset = offset;
+		__entry->value = value;
+	),
+	TP_printk("%s %04x %08x", dev_name(__entry->dev), __entry->offset,
+		  __entry->value)
+);
+
+DEFINE_EVENT(register_access, dc_writel,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+DEFINE_EVENT(register_access, dc_readl,
+	TP_PROTO(struct device *dev, unsigned int offset, u32 value),
+	TP_ARGS(dev, offset, value));
+
+#endif /* DRM_TEGRA_TRACE_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE trace
+#include <trace/define_trace.h>
-- 
2.13.3
