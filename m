From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] drm: tegra: reduce stack usage in register dump helpers
Date: Fri, 15 Sep 2017 21:50:36 +0200
Message-ID: <20170915195115.1316041-1-arnd@arndb.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The tracing code in the tegra drm driver can lead to excessive
stack usage in somem tegra_*_show_regs() functions:

drivers/gpu/drm/tegra/dc.c: In function 'tegra_dc_show_regs':
drivers/gpu/drm/tegra/dc.c:1639: error: the frame size of 1704 bytes is larger than 1024 bytes
drivers/gpu/drm/tegra/hdmi.c: In function 'tegra_hdmi_show_regs':
drivers/gpu/drm/tegra/hdmi.c:1414: error: the frame size of 1320 bytes is larger than 1024 bytes

I assume that we don't actually need to trace the register
accesses in those functions, so I'm converting all four
instances of this code to skip the tracing, which brings the
stack usage down to acceptable levels.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c   | 2 +-
 drivers/gpu/drm/tegra/drm.h  | 5 +++++
 drivers/gpu/drm/tegra/dsi.c  | 7 ++++++-
 drivers/gpu/drm/tegra/hdmi.c | 8 +++++++-
 drivers/gpu/drm/tegra/sor.c  | 7 ++++++-
 5 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 4df39112e38e..c80d1329f082 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1416,7 +1416,7 @@ static int tegra_dc_show_regs(struct seq_file *s, void *data)
 
 #define DUMP_REG(name)						\
 	seq_printf(s, "%-40s %#05x %08x\n", #name, name,	\
-		   tegra_dc_readl(dc, name))
+		   tegra_dc_readl_notrace(dc, name))
 
 	DUMP_REG(DC_CMD_GENERAL_INCR_SYNCPT);
 	DUMP_REG(DC_CMD_GENERAL_INCR_SYNCPT_CNTRL);
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 063f5d397526..308d61729a9f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -188,6 +188,11 @@ static inline u32 tegra_dc_readl(struct tegra_dc *dc, unsigned int offset)
 	return value;
 }
 
+static inline u32 tegra_dc_readl_notrace(struct tegra_dc *dc, unsigned int offset)
+{
+	return readl(dc->regs + (offset << 2));
+}
+
 struct tegra_dc_window {
 	struct {
 		unsigned int x;
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 046649ec9441..fe731d88198b 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -115,6 +115,11 @@ static inline u32 tegra_dsi_readl(struct tegra_dsi *dsi, unsigned int offset)
 	return value;
 }
 
+static inline u32 tegra_dsi_readl_notrace(struct tegra_dsi *dsi, unsigned int offset)
+{
+	return readl(dsi->regs + (offset << 2));
+}
+
 static inline void tegra_dsi_writel(struct tegra_dsi *dsi, u32 value,
 				    unsigned int offset)
 {
@@ -139,7 +144,7 @@ static int tegra_dsi_show_regs(struct seq_file *s, void *data)
 
 #define DUMP_REG(name)						\
 	seq_printf(s, "%-32s %#05x %08x\n", #name, name,	\
-		   tegra_dsi_readl(dsi, name))
+		   tegra_dsi_readl_notrace(dsi, name))
 
 	DUMP_REG(DSI_INCR_SYNCPT);
 	DUMP_REG(DSI_INCR_SYNCPT_CONTROL);
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 5b9d83b71943..3be5f1709585 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -110,6 +110,12 @@ static inline u32 tegra_hdmi_readl(struct tegra_hdmi *hdmi,
 	return value;
 }
 
+static inline u32 tegra_hdmi_readl_notrace(struct tegra_hdmi *hdmi,
+					   unsigned int offset)
+{
+	return readl(hdmi->regs + (offset << 2));
+}
+
 static inline void tegra_hdmi_writel(struct tegra_hdmi *hdmi, u32 value,
 				     unsigned int offset)
 {
@@ -1239,7 +1245,7 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 
 #define DUMP_REG(name)						\
 	seq_printf(s, "%-56s %#05x %08x\n", #name, name,	\
-		   tegra_hdmi_readl(hdmi, name))
+		   tegra_hdmi_readl_notrace(hdmi, name))
 
 	DUMP_REG(HDMI_CTXSW);
 	DUMP_REG(HDMI_NV_PDISP_SOR_STATE0);
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 7ab1d1dc7cd7..910d49f6c5d2 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -242,6 +242,11 @@ static inline u32 tegra_sor_readl(struct tegra_sor *sor, unsigned int offset)
 	return value;
 }
 
+static inline u32 tegra_sor_readl_notrace(struct tegra_sor *sor, unsigned int offset)
+{
+	return readl(sor->regs + (offset << 2));
+}
+
 static inline void tegra_sor_writel(struct tegra_sor *sor, u32 value,
 				    unsigned int offset)
 {
@@ -1120,7 +1125,7 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
 
 #define DUMP_REG(name)						\
 	seq_printf(s, "%-38s %#05x %08x\n", #name, name,	\
-		   tegra_sor_readl(sor, name))
+		   tegra_sor_readl_notrace(sor, name))
 
 	DUMP_REG(SOR_CTXSW);
 	DUMP_REG(SOR_SUPER_STATE0);
-- 
2.9.0
