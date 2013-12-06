From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: Rename cpu0 powergate to crail
Date: Fri,  6 Dec 2013 16:27:13 +0100
Message-ID: <1386343633-2137-2-git-send-email-treding@nvidia.com>
References: <1386343633-2137-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386343633-2137-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This matches the name of the powergate as listed in the TRM.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index 2c175c67e39f..426a4064e561 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -259,7 +259,7 @@ static const char * const powergate_name_t30[] = {
 };
 
 static const char * const powergate_name_t114[] = {
-	[TEGRA_POWERGATE_CPU]	= "cpu0",
+	[TEGRA_POWERGATE_CPU]	= "crail",
 	[TEGRA_POWERGATE_3D]	= "3d",
 	[TEGRA_POWERGATE_VENC]	= "venc",
 	[TEGRA_POWERGATE_VDEC]	= "vdec",
-- 
1.8.4.2
