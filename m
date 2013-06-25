From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/11] ARM: tegra114: hook tegra_tear_down_cpu function
Date: Tue, 25 Jun 2013 17:27:50 +0800
Message-ID: <1372152475-18617-7-git-send-email-josephl@nvidia.com>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372152475-18617-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hooking tegra_tear_down_cpu for Tegra114 for supporting cluster power
down when CPU cluster suspneded in LP2.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 94e69be..a0668a2 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -52,6 +52,7 @@ static void tegra_tear_down_cpu_init(void)
 			tegra_tear_down_cpu = tegra20_tear_down_cpu;
 		break;
 	case TEGRA30:
+	case TEGRA114:
 		if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC))
 			tegra_tear_down_cpu = tegra30_tear_down_cpu;
 		break;
-- 
1.8.3.1
