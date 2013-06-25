From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 07/11] ARM: tegra114: flowctrl: add support for cpu_suspend_enter/exit
Date: Tue, 25 Jun 2013 17:27:51 +0800
Message-ID: <1372152475-18617-8-git-send-email-josephl@nvidia.com>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372152475-18617-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The flow controller can help CPU to go into suspend mode (powered-down
state). When CPU goes into powered-down state, it needs some careful
settings before getting into and after leaving. The enter and exit
functions do that by configuring appropriate mode for flow controller.

For Tegra114, the setting is compatible with Tegra30.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/flowctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-tegra/flowctrl.c b/arch/arm/mach-tegra/flowctrl.c
index b477ef3..5348543 100644
--- a/arch/arm/mach-tegra/flowctrl.c
+++ b/arch/arm/mach-tegra/flowctrl.c
@@ -86,6 +86,7 @@ void flowctrl_cpu_suspend_enter(unsigned int cpuid)
 		reg |= TEGRA20_FLOW_CTRL_CSR_WFE_CPU0 << cpuid;
 		break;
 	case TEGRA30:
+	case TEGRA114:
 		/* clear wfe bitmap */
 		reg &= ~TEGRA30_FLOW_CTRL_CSR_WFE_BITMAP;
 		/* clear wfi bitmap */
@@ -123,6 +124,7 @@ void flowctrl_cpu_suspend_exit(unsigned int cpuid)
 		reg &= ~TEGRA20_FLOW_CTRL_CSR_WFI_BITMAP;
 		break;
 	case TEGRA30:
+	case TEGRA114:
 		/* clear wfe bitmap */
 		reg &= ~TEGRA30_FLOW_CTRL_CSR_WFE_BITMAP;
 		/* clear wfi bitmap */
-- 
1.8.3.1
