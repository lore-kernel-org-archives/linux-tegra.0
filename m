From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/12] drm/tegra: dc: Move state definition to header
Date: Mon, 27 Nov 2017 11:09:45 +0100
Message-ID: <20171127100952.22465-6-thierry.reding@gmail.com>
References: <20171127100952.22465-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100952.22465-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Move the display controller state definition to the header file so that
it can be referenced by other files.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 18 ------------------
 drivers/gpu/drm/tegra/dc.h | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 1075b4e06834..88b8d137726e 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -34,24 +34,6 @@ static inline struct tegra_plane *to_tegra_plane(struct drm_plane *plane)
 	return container_of(plane, struct tegra_plane, base);
 }
 
-struct tegra_dc_state {
-	struct drm_crtc_state base;
-
-	struct clk *clk;
-	unsigned long pclk;
-	unsigned int div;
-
-	u32 planes;
-};
-
-static inline struct tegra_dc_state *to_dc_state(struct drm_crtc_state *state)
-{
-	if (state)
-		return container_of(state, struct tegra_dc_state, base);
-
-	return NULL;
-}
-
 struct tegra_plane_state {
 	struct drm_plane_state base;
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 6e46e4aed10b..b65dfbb0af89 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -18,6 +18,24 @@
 
 struct tegra_output;
 
+struct tegra_dc_state {
+	struct drm_crtc_state base;
+
+	struct clk *clk;
+	unsigned long pclk;
+	unsigned int div;
+
+	u32 planes;
+};
+
+static inline struct tegra_dc_state *to_dc_state(struct drm_crtc_state *state)
+{
+	if (state)
+		return container_of(state, struct tegra_dc_state, base);
+
+	return NULL;
+}
+
 struct tegra_dc_stats {
 	unsigned long frames;
 	unsigned long vblank;
-- 
2.15.0
