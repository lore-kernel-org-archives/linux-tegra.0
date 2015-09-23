From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH v2 2/2] ARM: tegra: Disable cpuidle driver if PSCI is present
Date: Wed, 23 Sep 2015 08:39:44 +0200
Message-ID: <5151ffebe8611545c55f8cc499cf2368b1b789c4.1442990383.git.jan.kiszka@siemens.com>
References: <cover.1442990383.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1442990383.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1442990383.git.jan.kiszka@siemens.com>
References: <cover.1442990383.git.jan.kiszka@siemens.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

The firmware takes over the ownership of the flow controller when it
provides PSCI support. To avoid clashes, disable the Tegra cpuidle
driver if PSCI was detected.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 arch/arm/mach-tegra/Kconfig | 1 +
 arch/arm/mach-tegra/tegra.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 0fa4c5f..373768c 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -4,6 +4,7 @@ menuconfig ARCH_TEGRA
 	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
 	select ARM_AMBA
 	select ARM_GIC
+	select ARM_PSCI
 	select CLKSRC_MMIO
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 2378fa56..d97c961 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -44,6 +44,7 @@
 #include <asm/mach-types.h>
 #include <asm/setup.h>
 #include <asm/trusted_foundations.h>
+#include <asm/psci.h>
 
 #include "board.h"
 #include "common.h"
@@ -136,7 +137,8 @@ static void __init tegra_dt_init_late(void)
 	int i;
 
 	tegra_init_suspend();
-	tegra_cpuidle_init();
+	if (!psci_smp_available())
+		tegra_cpuidle_init();
 
 	for (i = 0; i < ARRAY_SIZE(board_init_funcs); i++) {
 		if (of_machine_is_compatible(board_init_funcs[i].machine)) {
-- 
2.1.4
