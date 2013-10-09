From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/7] ARM: tegra: hook tegra_cpu_tear_down for Tegra124
Date: Wed, 9 Oct 2013 17:20:07 +0800
Message-ID: <1381310411-11391-4-git-send-email-josephl@nvidia.com>
References: <1381310411-11391-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381310411-11391-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hook the tegra_cpu_tear_down function for Tegra124 to support platform
suspend.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/pm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 36ed88a..14e75b7 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -59,8 +59,10 @@ static void tegra_tear_down_cpu_init(void)
 		break;
 	case TEGRA30:
 	case TEGRA114:
+	case TEGRA124:
 		if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC) ||
-		    IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC))
+		    IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) ||
+		    IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC))
 			tegra_tear_down_cpu = tegra30_tear_down_cpu;
 		break;
 	}
-- 
1.8.4
