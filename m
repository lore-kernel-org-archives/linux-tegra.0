From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/7] ARM: tegra: hook the LP1 iram code area and sleep_core function for Tegra124
Date: Wed, 9 Oct 2013 17:20:09 +0800
Message-ID: <1381310411-11391-6-git-send-email-josephl@nvidia.com>
References: <1381310411-11391-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381310411-11391-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

To support LP1, we need to hook sleep_core function. That will turn off
MMU and jump to the IRAM to execute the rest of LP1 suspend function.
And we need the the LP1 IRAM addr to backup the original content and
replace it with LP1 low level support code.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/Makefile | 1 +
 arch/arm/mach-tegra/pm.c     | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index de3748e..019bb17 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -36,6 +36,7 @@ ifeq ($(CONFIG_CPU_IDLE),y)
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= cpuidle-tegra114.o
 endif
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= sleep-tegra30.o
+obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= pm-tegra30.o
 ifeq ($(CONFIG_CPU_IDLE),y)
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= cpuidle-tegra114.o
 endif
diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 14e75b7..4ae0286 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -218,8 +218,10 @@ static bool tegra_lp1_iram_hook(void)
 		break;
 	case TEGRA30:
 	case TEGRA114:
+	case TEGRA124:
 		if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC) ||
-		    IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC))
+		    IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) ||
+		    IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC))
 			tegra30_lp1_iram_hook();
 		break;
 	default:
@@ -246,8 +248,10 @@ static bool tegra_sleep_core_init(void)
 		break;
 	case TEGRA30:
 	case TEGRA114:
+	case TEGRA124:
 		if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC) ||
-		    IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC))
+		    IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) ||
+		    IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC))
 			tegra30_sleep_core_init();
 		break;
 	default:
-- 
1.8.4
