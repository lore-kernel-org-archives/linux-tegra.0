From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: [v4 1/6] ARM: tegra: Use DT /cpu node to detect number of CPU core
Date: Thu, 24 Jan 2013 13:10:21 +0200
Message-ID: <1359025829-22306-2-git-send-email-hdoyu@nvidia.com>
References: <1359025829-22306-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359025829-22306-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Hiroshi Doyu <hdoyu@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Jason Cooper <jason@lakedaemon.net>, Shawn Guo <shawn.guo@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra SoCs does not use SCU based to detect CPU core numbers but they
use DT /cpu node. If it's not provided or failed, it continues as a
single core.

Signed-off-by: Hiroshi Doyu <hdoyu@nvidia.com>
Reviewed-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---
Based on the discussion:
http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/140608.html
---
 arch/arm/mach-tegra/platsmp.c |   15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
index 3ec7fc4..ee847896 100644
--- a/arch/arm/mach-tegra/platsmp.c
+++ b/arch/arm/mach-tegra/platsmp.c
@@ -177,23 +177,8 @@ done:
 	return status;
 }
 
-/*
- * Initialise the CPU possible map early - this describes the CPUs
- * which may be present or become present in the system.
- */
 static void __init tegra_smp_init_cpus(void)
 {
-	unsigned int i, ncores = scu_get_core_count(scu_base);
-
-	if (ncores > nr_cpu_ids) {
-		pr_warn("SMP: %u cores greater than maximum (%u), clipping\n",
-			ncores, nr_cpu_ids);
-		ncores = nr_cpu_ids;
-	}
-
-	for (i = 0; i < ncores; i++)
-		set_cpu_possible(i, true);
-
 	set_smp_cross_call(gic_raise_softirq);
 }
 
-- 
1.7.9.5
