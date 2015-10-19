From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] ARM: tegra: rename GPU functions
Date: Mon, 19 Oct 2015 13:57:03 +0900
Message-ID: <1445230624-30314-4-git-send-email-acourbot@nvidia.com>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445230624-30314-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Rename GPU functions to less generic names to avoid potential name
collisions.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/include/asm/arch-tegra/gpu.h | 8 ++++----
 arch/arm/mach-tegra/board2.c          | 4 ++--
 arch/arm/mach-tegra/gpu.c             | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/arch-tegra/gpu.h b/arch/arm/include/asm/arch-tegra/gpu.h
index 2fdb2c5049e6..4423386f2805 100644
--- a/arch/arm/include/asm/arch-tegra/gpu.h
+++ b/arch/arm/include/asm/arch-tegra/gpu.h
@@ -10,11 +10,11 @@
 
 #if defined(CONFIG_TEGRA_GPU)
 
-void config_gpu(void);
+void tegra_gpu_config(void);
 
 #else /* CONFIG_TEGRA_GPU */
 
-static inline void config_gpu(void)
+static inline void tegra_gpu_config(void)
 {
 }
 
@@ -22,11 +22,11 @@ static inline void config_gpu(void)
 
 #if defined(CONFIG_OF_LIBFDT)
 
-int gpu_enable_node(void *blob, const char *gpupath);
+int tegra_gpu_enable_node(void *blob, const char *gpupath);
 
 #else /* CONFIG_OF_LIBFDT */
 
-static inline int gpu_enable_node(void *blob, const char *gpupath)
+static inline int tegra_gpu_enable_node(void *blob, const char *gpupath)
 {
 	return 0;
 }
diff --git a/arch/arm/mach-tegra/board2.c b/arch/arm/mach-tegra/board2.c
index ff9e77cfa3a3..8ba143d996ca 100644
--- a/arch/arm/mach-tegra/board2.c
+++ b/arch/arm/mach-tegra/board2.c
@@ -128,7 +128,7 @@ int board_init(void)
 	clock_init();
 	clock_verify();
 
-	config_gpu();
+	tegra_gpu_config();
 
 #ifdef CONFIG_TEGRA_SPI
 	pin_mux_spi();
@@ -419,7 +419,7 @@ int ft_system_setup(void *blob, bd_t *bd)
 
 	/* Enable GPU node if GPU setup has been performed */
 	if (gpu_path != NULL)
-		return gpu_enable_node(blob, gpu_path);
+		return tegra_gpu_enable_node(blob, gpu_path);
 
 	return 0;
 }
diff --git a/arch/arm/mach-tegra/gpu.c b/arch/arm/mach-tegra/gpu.c
index dc29b79e0126..c7d705d8efe9 100644
--- a/arch/arm/mach-tegra/gpu.c
+++ b/arch/arm/mach-tegra/gpu.c
@@ -25,7 +25,7 @@
 
 static bool _configured;
 
-void config_gpu(void)
+void tegra_gpu_config(void)
 {
 	struct mc_ctlr *mc = (struct mc_ctlr *)NV_PA_MC_BASE;
 
@@ -43,7 +43,7 @@ void config_gpu(void)
 
 #if defined(CONFIG_OF_LIBFDT)
 
-int gpu_enable_node(void *blob, const char *gpupath)
+int tegra_gpu_enable_node(void *blob, const char *gpupath)
 {
 	int offset;
 
-- 
2.6.1
