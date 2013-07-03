From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 06/11] ARM: tegra114: hook tegra_tear_down_cpu function
Date: Wed, 3 Jul 2013 17:50:42 +0800
Message-ID: <1372845047-25147-7-git-send-email-josephl@nvidia.com>
References: <1372845047-25147-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372845047-25147-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hooking tegra_tear_down_cpu for Tegra114 for supporting cluster power
down when CPU cluster suspneded in LP2.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* take care the combination of the selection of the config ARCH_TEGRA_3x_SOC
  and TEGRA_114_SOC
---
 arch/arm/mach-tegra/pm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 261fec1..3d07cd5 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -52,7 +52,9 @@ static void tegra_tear_down_cpu_init(void)
 			tegra_tear_down_cpu = tegra20_tear_down_cpu;
 		break;
 	case TEGRA30:
-		if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC))
+	case TEGRA114:
+		if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC) ||
+		    IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC))
 			tegra_tear_down_cpu = tegra30_tear_down_cpu;
 		break;
 	}
-- 
1.8.3.2
