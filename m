From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] ARM: tegra: remove vpr_configured() function
Date: Mon, 19 Oct 2015 13:57:01 +0900
Message-ID: <1445230624-30314-2-git-send-email-acourbot@nvidia.com>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445230624-30314-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There is no justification for this function, especially in exported
form.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/include/asm/arch-tegra/gpu.h | 6 ------
 arch/arm/mach-tegra/gpu.c             | 7 +------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm/include/asm/arch-tegra/gpu.h b/arch/arm/include/asm/arch-tegra/gpu.h
index 52280f40ce31..2fdb2c5049e6 100644
--- a/arch/arm/include/asm/arch-tegra/gpu.h
+++ b/arch/arm/include/asm/arch-tegra/gpu.h
@@ -11,7 +11,6 @@
 #if defined(CONFIG_TEGRA_GPU)
 
 void config_gpu(void);
-bool gpu_configured(void);
 
 #else /* CONFIG_TEGRA_GPU */
 
@@ -19,11 +18,6 @@ static inline void config_gpu(void)
 {
 }
 
-static inline bool gpu_configured(void)
-{
-	return false;
-}
-
 #endif /* CONFIG_TEGRA_GPU */
 
 #if defined(CONFIG_OF_LIBFDT)
diff --git a/arch/arm/mach-tegra/gpu.c b/arch/arm/mach-tegra/gpu.c
index 4ea046d3e5b6..dc29b79e0126 100644
--- a/arch/arm/mach-tegra/gpu.c
+++ b/arch/arm/mach-tegra/gpu.c
@@ -41,18 +41,13 @@ void config_gpu(void)
 	_configured = true;
 }
 
-bool vpr_configured(void)
-{
-	return _configured;
-}
-
 #if defined(CONFIG_OF_LIBFDT)
 
 int gpu_enable_node(void *blob, const char *gpupath)
 {
 	int offset;
 
-	if (vpr_configured()) {
+	if (_configured) {
 		offset = fdt_path_offset(blob, gpupath);
 		if (offset > 0) {
 			fdt_status_okay(blob, offset);
-- 
2.6.1
