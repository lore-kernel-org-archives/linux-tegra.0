From: Andrey Danin <danindrey@mail.ru>
Subject: [PATCH 3/3] dt: paz00: define nvec as child of i2c bus
Date: Thu, 29 Jan 2015 10:20:22 +0300
Message-ID: <1422516022-27161-4-git-send-email-danindrey@mail.ru>
References: <1422516022-27161-1-git-send-email-danindrey@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422516022-27161-1-git-send-email-danindrey@mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Marc Dietrich <marvin24@gmx.de>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Andrey Danin <danindrey@mail.ru>
List-Id: linux-tegra@vger.kernel.org

NVEC driver was reimplemented to use tegra i2c. Use common i2c bindings
for NVEC node.

Signed-off-by: Andrey Danin <danindrey@mail.ru>
---
 .../devicetree/bindings/nvec/nvidia,nvec.txt       | 19 ++-----------------
 arch/arm/boot/dts/tegra20-paz00.dts                | 22 +++++++++-------------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvec/nvidia,nvec.txt b/Documentation/devicetree/bindings/nvec/nvidia,nvec.txt
index 5ae601e..d82c125 100644
--- a/Documentation/devicetree/bindings/nvec/nvidia,nvec.txt
+++ b/Documentation/devicetree/bindings/nvec/nvidia,nvec.txt
@@ -2,20 +2,5 @@ NVIDIA compliant embedded controller
 
 Required properties:
 - compatible : should be "nvidia,nvec".
-- reg : the iomem of the i2c slave controller
-- interrupts : the interrupt line of the i2c slave controller
-- clock-frequency : the frequency of the i2c bus
-- gpios : the gpio used for ec request
-- slave-addr: the i2c address of the slave controller
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  Tegra20/Tegra30:
-  - div-clk
-  - fast-clk
-  Tegra114:
-  - div-clk
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - i2c
+- request-gpios : the gpio used for ec request
+- reg: the i2c address of the slave controller
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ed7e100..65e247b 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -288,20 +288,16 @@
 		clock-frequency = <100000>;
 	};
 
-	nvec@7000c500 {
-		compatible = "nvidia,nvec";
-		reg = <0x7000c500 0x100>;
-		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
+	i2c@7000c500 {
+		status = "okay";
 		clock-frequency = <80000>;
-		request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
-		slave-addr = <138>;
-		clocks = <&tegra_car TEGRA20_CLK_I2C3>,
-		         <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
-		clock-names = "div-clk", "fast-clk";
-		resets = <&tegra_car 67>;
-		reset-names = "i2c";
+
+		nvec: nvec@45 {
+			compatible = "nvidia,nvec";
+			request-gpios = <&gpio TEGRA_GPIO(V, 2)
+				GPIO_ACTIVE_HIGH>;
+			reg = <0x45>;
+		};
 	};
 
 	i2c@7000d000 {
-- 
1.9.1
