From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/7] ARM: tegra: add flow controller to support suspend for Tegra124
Date: Wed, 9 Oct 2013 17:20:06 +0800
Message-ID: <1381310411-11391-3-git-send-email-josephl@nvidia.com>
References: <1381310411-11391-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381310411-11391-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable the configuration of flow controller to support the last CPU
(CPU0) suspend function with cluster power down.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/flowctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-tegra/flowctrl.c b/arch/arm/mach-tegra/flowctrl.c
index 5348543..ce8ab8a 100644
--- a/arch/arm/mach-tegra/flowctrl.c
+++ b/arch/arm/mach-tegra/flowctrl.c
@@ -87,6 +87,7 @@ void flowctrl_cpu_suspend_enter(unsigned int cpuid)
 		break;
 	case TEGRA30:
 	case TEGRA114:
+	case TEGRA124:
 		/* clear wfe bitmap */
 		reg &= ~TEGRA30_FLOW_CTRL_CSR_WFE_BITMAP;
 		/* clear wfi bitmap */
@@ -125,6 +126,7 @@ void flowctrl_cpu_suspend_exit(unsigned int cpuid)
 		break;
 	case TEGRA30:
 	case TEGRA114:
+	case TEGRA124:
 		/* clear wfe bitmap */
 		reg &= ~TEGRA30_FLOW_CTRL_CSR_WFE_BITMAP;
 		/* clear wfi bitmap */
-- 
1.8.4
