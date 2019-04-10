From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] ARM: tegra: Sort dependencies alphabetically
Date: Wed, 10 Apr 2019 10:57:07 +0200
Message-ID: <20190410085708.10798-1-thierry.reding@gmail.com>
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
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The list of dependencies has become unsorted, which makes it difficult
to find the right place to insert new dependencies. Restore alphabetical
order to make future additions easier.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/mach-tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 7f3b83e0d324..7b3fd0995a16 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -2,6 +2,7 @@
 menuconfig ARCH_TEGRA
 	bool "NVIDIA Tegra"
 	depends on ARCH_MULTI_V7
+	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
 	select ARM_AMBA
 	select ARM_GIC
@@ -11,7 +12,6 @@ menuconfig ARCH_TEGRA
 	select HAVE_ARM_TWD if SMP
 	select PINCTRL
 	select PM_OPP
-	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
 	select SOC_BUS
 	select ZONE_DMA if ARM_LPAE
-- 
2.21.0
