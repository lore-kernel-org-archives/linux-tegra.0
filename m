From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: tegra: remove redundant ARM_L1_CACHE_SHIFT_6 select
Date: Sat, 23 Jan 2016 17:55:30 +0900
Message-ID: <1453539330-11903-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

These two are both ARMv7 SoCs.  They need not explicitly select
ARM_L1_CACHE_SHIFT_6 because it is enabled along with CPU_V7.

Refer to commit a092f2b15399 ("ARM: 7291/1: cache: assume 64-byte L1
cachelines for ARMv7 CPUs").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/soc/tegra/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index d0c3c3e..03089ad 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -31,7 +31,6 @@ config ARCH_TEGRA_3x_SOC
 config ARCH_TEGRA_114_SOC
 	bool "Enable support for Tegra114 family"
 	select ARM_ERRATA_798181 if SMP
-	select ARM_L1_CACHE_SHIFT_6
 	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL_TEGRA114
 	select TEGRA_TIMER
@@ -41,7 +40,6 @@ config ARCH_TEGRA_114_SOC
 
 config ARCH_TEGRA_124_SOC
 	bool "Enable support for Tegra124 family"
-	select ARM_L1_CACHE_SHIFT_6
 	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL_TEGRA124
 	select TEGRA_TIMER
-- 
1.9.1
