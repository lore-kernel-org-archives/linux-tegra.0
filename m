From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM: tegra: enable CPU idle for Tegra124
Date: Tue, 8 Oct 2013 16:23:07 +0800
Message-ID: <1381220587-29697-5-git-send-email-josephl@nvidia.com>
References: <1381220587-29697-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381220587-29697-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The CPUIdle function of Tegra124 is identical to Tegra114, so we share
the same driver with Tegra114.

Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/Makefile  | 3 +++
 arch/arm/mach-tegra/cpuidle.c | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 04ca2b3..de3748e 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -36,5 +36,8 @@ ifeq ($(CONFIG_CPU_IDLE),y)
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= cpuidle-tegra114.o
 endif
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= sleep-tegra30.o
+ifeq ($(CONFIG_CPU_IDLE),y)
+obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= cpuidle-tegra114.o
+endif
 
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= board-paz00.o
diff --git a/arch/arm/mach-tegra/cpuidle.c b/arch/arm/mach-tegra/cpuidle.c
index 0961dfc..7bc5d8d 100644
--- a/arch/arm/mach-tegra/cpuidle.c
+++ b/arch/arm/mach-tegra/cpuidle.c
@@ -39,7 +39,9 @@ void __init tegra_cpuidle_init(void)
 			tegra30_cpuidle_init();
 		break;
 	case TEGRA114:
-		if (IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC))
+	case TEGRA124:
+		if (IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) ||
+		    IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC))
 			tegra114_cpuidle_init();
 		break;
 	}
-- 
1.8.4
