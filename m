From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra30: clocks: fix the wrong tegra_audio_sync_clk_ops name
Date: Fri, 17 Aug 2012 14:54:10 +0800
Message-ID: <1345186450-4517-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

It should use tegra30_audio_sync_clk_ops for tegra30. It will cause
the tegra30 use the wrong audio_sync_clk_ops when build a kernel with
a tegra20 and tegra30 both supported kernel. And building error when
a tegra30-only kernel.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra30_clocks.h      |    2 +-
 arch/arm/mach-tegra/tegra30_clocks_data.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra30_clocks.h b/arch/arm/mach-tegra/tegra30_clocks.h
index b08b8d9..f2f88fe 100644
--- a/arch/arm/mach-tegra/tegra30_clocks.h
+++ b/arch/arm/mach-tegra/tegra30_clocks.h
@@ -28,7 +28,7 @@ extern struct clk_ops tegra30_plle_ops;
 extern struct clk_ops tegra_cml_clk_ops;
 extern struct clk_ops tegra_pciex_clk_ops;
 extern struct clk_ops tegra_sync_source_ops;
-extern struct clk_ops tegra_audio_sync_clk_ops;
+extern struct clk_ops tegra30_audio_sync_clk_ops;
 extern struct clk_ops tegra30_clk_double_ops;
 extern struct clk_ops tegra_clk_out_ops;
 extern struct clk_ops tegra30_super_ops;
diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index 2271ac1..3d2e553 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -521,7 +521,7 @@ static const char *mux_audio_sync_clk[] = {
 	};							\
 	static struct clk tegra_##_name = {			\
 		.name = #_name,					\
-		.ops = &tegra_audio_sync_clk_ops,		\
+		.ops = &tegra30_audio_sync_clk_ops,		\
 		.hw = &tegra_##_name##_hw.hw,			\
 		.parent_names = mux_audio_sync_clk,		\
 		.parents = tegra_sync_source_list,		\
-- 
1.7.0.4
