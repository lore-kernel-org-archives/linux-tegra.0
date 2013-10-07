From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/7] ARM: tegra: add SMP support for Tegra124
Date: Mon, 7 Oct 2013 15:31:21 +0800
Message-ID: <1381131085-26116-4-git-send-email-josephl@nvidia.com>
References: <1381131085-26116-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381131085-26116-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The power up method is same as Tegra114, so we share the same function
for it.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
index 2d02036..eb72ae7 100644
--- a/arch/arm/mach-tegra/platsmp.c
+++ b/arch/arm/mach-tegra/platsmp.c
@@ -176,6 +176,8 @@ static int tegra_boot_secondary(unsigned int cpu,
 		return tegra30_boot_secondary(cpu, idle);
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) && tegra_chip_id == TEGRA114)
 		return tegra114_boot_secondary(cpu, idle);
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) && tegra_chip_id == TEGRA124)
+		return tegra114_boot_secondary(cpu, idle);
 
 	return -EINVAL;
 }
-- 
1.8.4
