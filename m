From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: [PATCH v3 07/10] arm/tegra: Add PWFM controller device tree probing
Date: Wed, 22 Feb 2012 16:17:18 +0100
Message-ID: <1329923841-32017-8-git-send-email-thierry.reding@avionic-design.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Mitch Bradley <wmb@firmworks.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Mike Frysinger <vapier@gentoo.org>, Ryan Mallon <rmallon@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, Colin Cross <ccross@android.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Lars-Peter Clausen <lars@metafoo.de>, Richard Purdie <rpurdie@rpsys.net>, Matthias Kaehlcke <matthias@kaehlcke.net>, linux-tegra@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, linux-arm-kernel@lists.infradead.org, Kurt Van Dijck <kurt.van.dijck@eia.be>
List-Id: linux-tegra@vger.kernel.org

Add auxdata to instantiate a device tree for the PWFM controller and
include a corresponding node in the device tree.

Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
---
Changes in v3:
  - add missing include for mach/iomap.h

Changes in v2:
  - none

 arch/arm/boot/dts/tegra20.dtsi         |    6 ++++++
 arch/arm/boot/dts/tegra30.dtsi         |    6 ++++++
 arch/arm/mach-tegra/board-dt-tegra20.c |    1 +
 arch/arm/mach-tegra/board-dt-tegra30.c |    3 +++
 4 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index ec1f010..c34e6c3 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -148,6 +148,12 @@
 		interrupts = < 0 91 0x04 >;
 	};
 
+	pwm: pwm@7000a000 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x100>;
+		#pwm-cells = <2>;
+	};
+
 	emc@7000f400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index ac4b75c..77bd985 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -146,6 +146,12 @@
 		interrupts = < 0 91 0x04 >;
 	};
 
+	pwm: pwm@7000a000 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x100>;
+		#pwm-cells = <2>;
+	};
+
 	sdhci@78000000 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000000 0x200>;
diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index 7a95e0b..bad0dd1 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -73,6 +73,7 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
 		       &tegra_ehci2_device.dev.platform_data),
 	OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB3_BASE, "tegra-ehci.2",
 		       &tegra_ehci3_device.dev.platform_data),
+	OF_DEV_AUXDATA("nvidia,tegra20-pwm", TEGRA_PWFM_BASE, "tegra-pwm", NULL),
 	{}
 };
 
diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index b4124b1..194ae1e 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -33,6 +33,8 @@
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
 
+#include <mach/iomap.h>
+
 #include "board.h"
 #include "clock.h"
 
@@ -51,6 +53,7 @@ struct of_dev_auxdata tegra30_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", 0x7000C500, "tegra-i2c.2", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", 0x7000C700, "tegra-i2c.3", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", 0x7000D000, "tegra-i2c.4", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra20-pwm", TEGRA_PWFM_BASE, "tegra-pwm", NULL),
 	{}
 };
 
-- 
1.7.9.1
