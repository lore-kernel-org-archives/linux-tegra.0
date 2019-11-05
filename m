From: Jamal Shareef <jamal.k.shareef@gmail.com>
Subject: [PATCH 1/3] drm/tegra: dc: Remove space after parenthesis
Date: Mon,  4 Nov 2019 18:23:20 -0800
Message-ID: <8e5b985c756f33decd07a728b7fc24b5518b3b47.1572920482.git.jamal.k.shareef@gmail.com>
References: <cover.1572920482.git.jamal.k.shareef@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1572920482.git.jamal.k.shareef@gmail.com>
In-Reply-To: <cover.1572920482.git.jamal.k.shareef@gmail.com>
References: <cover.1572920482.git.jamal.k.shareef@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: outreachy-kernel@googlegroups.com
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jamal Shareef <jamal.k.shareef@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Removes space after left parenthesis. Issue found by checkpatch.

Signed-off-by: Jamal Shareef <jamal.k.shareef@gmail.com>
---
 drivers/gpu/drm/tegra/dc.h | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0c4d17851f47..01fe9cc078ff 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -406,15 +406,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DISP_ORDER_BLUE_RED        (1 << 9)
 
 #define DC_DISP_DISP_COLOR_CONTROL		0x430
-#define BASE_COLOR_SIZE666     ( 0 << 0)
-#define BASE_COLOR_SIZE111     ( 1 << 0)
-#define BASE_COLOR_SIZE222     ( 2 << 0)
-#define BASE_COLOR_SIZE333     ( 3 << 0)
-#define BASE_COLOR_SIZE444     ( 4 << 0)
-#define BASE_COLOR_SIZE555     ( 5 << 0)
-#define BASE_COLOR_SIZE565     ( 6 << 0)
-#define BASE_COLOR_SIZE332     ( 7 << 0)
-#define BASE_COLOR_SIZE888     ( 8 << 0)
+#define BASE_COLOR_SIZE666     (0 << 0)
+#define BASE_COLOR_SIZE111     (1 << 0)
+#define BASE_COLOR_SIZE222     (2 << 0)
+#define BASE_COLOR_SIZE333     (3 << 0)
+#define BASE_COLOR_SIZE444     (4 << 0)
+#define BASE_COLOR_SIZE555     (5 << 0)
+#define BASE_COLOR_SIZE565     (6 << 0)
+#define BASE_COLOR_SIZE332     (7 << 0)
+#define BASE_COLOR_SIZE888     (8 << 0)
 #define BASE_COLOR_SIZE101010  (10 << 0)
 #define BASE_COLOR_SIZE121212  (12 << 0)
 #define DITHER_CONTROL_MASK    (3 << 8)
@@ -422,17 +422,17 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DITHER_CONTROL_ORDERED (2 << 8)
 #define DITHER_CONTROL_ERRDIFF (3 << 8)
 #define BASE_COLOR_SIZE_MASK   (0xf << 0)
-#define BASE_COLOR_SIZE_666    (  0 << 0)
-#define BASE_COLOR_SIZE_111    (  1 << 0)
-#define BASE_COLOR_SIZE_222    (  2 << 0)
-#define BASE_COLOR_SIZE_333    (  3 << 0)
-#define BASE_COLOR_SIZE_444    (  4 << 0)
-#define BASE_COLOR_SIZE_555    (  5 << 0)
-#define BASE_COLOR_SIZE_565    (  6 << 0)
-#define BASE_COLOR_SIZE_332    (  7 << 0)
-#define BASE_COLOR_SIZE_888    (  8 << 0)
-#define BASE_COLOR_SIZE_101010 ( 10 << 0)
-#define BASE_COLOR_SIZE_121212 ( 12 << 0)
+#define BASE_COLOR_SIZE_666    (0 << 0)
+#define BASE_COLOR_SIZE_111    (1 << 0)
+#define BASE_COLOR_SIZE_222    (2 << 0)
+#define BASE_COLOR_SIZE_333    (3 << 0)
+#define BASE_COLOR_SIZE_444    (4 << 0)
+#define BASE_COLOR_SIZE_555    (5 << 0)
+#define BASE_COLOR_SIZE_565    (6 << 0)
+#define BASE_COLOR_SIZE_332    (7 << 0)
+#define BASE_COLOR_SIZE_888    (8 << 0)
+#define BASE_COLOR_SIZE_101010 (10 << 0)
+#define BASE_COLOR_SIZE_121212 (12 << 0)
 
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
 #define  SC1_H_QUALIFIER_NONE	(1 << 16)
-- 
2.17.1
