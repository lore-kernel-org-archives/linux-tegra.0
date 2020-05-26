From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] drm/tegra: gr2d: Add tiled PATBASE address register
Date: Tue, 26 May 2020 23:57:53 +0300
Message-ID: <20200526205753.14423-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There are two PATBASE address registers, one for linear layout and other
for tiled. The driver's address registers list misses the tiled PATBASE
register.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/gr2d.c | 1 +
 drivers/gpu/drm/tegra/gr2d.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 48363f744bb9..1a0d3ba6e525 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -177,6 +177,7 @@ static const u32 gr2d_addr_regs[] = {
 	GR2D_DSTC_BASE_ADDR,
 	GR2D_SRCA_BASE_ADDR,
 	GR2D_SRCB_BASE_ADDR,
+	GR2D_PATBASE_ADDR,
 	GR2D_SRC_BASE_ADDR_SB,
 	GR2D_DSTA_BASE_ADDR_SB,
 	GR2D_DSTB_BASE_ADDR_SB,
diff --git a/drivers/gpu/drm/tegra/gr2d.h b/drivers/gpu/drm/tegra/gr2d.h
index 2398486f0699..9b7d66e15b9f 100644
--- a/drivers/gpu/drm/tegra/gr2d.h
+++ b/drivers/gpu/drm/tegra/gr2d.h
@@ -14,6 +14,7 @@
 #define GR2D_DSTC_BASE_ADDR		0x2d
 #define GR2D_SRCA_BASE_ADDR		0x31
 #define GR2D_SRCB_BASE_ADDR		0x32
+#define GR2D_PATBASE_ADDR		0x47
 #define GR2D_SRC_BASE_ADDR_SB		0x48
 #define GR2D_DSTA_BASE_ADDR_SB		0x49
 #define GR2D_DSTB_BASE_ADDR_SB		0x4a
-- 
2.26.0
