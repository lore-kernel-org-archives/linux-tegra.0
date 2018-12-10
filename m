From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/4] ARM: tegra: avoid section mismatch warning
Date: Mon, 10 Dec 2018 22:58:37 +0100
Message-ID: <20181210215856.2238253-2-arnd@arndb.de>
References: <20181210215856.2238253-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181210215856.2238253-1-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

WARNING: vmlinux.o(.text+0x39ecc): Section mismatch in reference from the function tegra114_gic_cpu_pm_registration() to the (unknown reference) .init.rodata:(unknown)
The function tegra114_gic_cpu_pm_registration() references
the (unknown reference) __initconst (unknown).
This is often because tegra114_gic_cpu_pm_registration lacks a __initconst
annotation or the annotation of (unknown) is wrong.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-tegra/irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
index a69b22d37eed..a186ab663b0b 100644
--- a/arch/arm/mach-tegra/irq.c
+++ b/arch/arm/mach-tegra/irq.c
@@ -72,7 +72,7 @@ static const struct of_device_id tegra114_dt_gic_match[] __initconst = {
 	{ }
 };
 
-static void tegra114_gic_cpu_pm_registration(void)
+static void __init tegra114_gic_cpu_pm_registration(void)
 {
 	struct device_node *dn;
 
@@ -85,7 +85,7 @@ static void tegra114_gic_cpu_pm_registration(void)
 	cpu_pm_register_notifier(&tegra_gic_notifier_block);
 }
 #else
-static void tegra114_gic_cpu_pm_registration(void) { }
+static void __init tegra114_gic_cpu_pm_registration(void) { }
 #endif
 
 static const struct of_device_id tegra_ictlr_match[] __initconst = {
-- 
2.20.0
