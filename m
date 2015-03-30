From: Andrey Danin <danindrey@mail.ru>
Subject: [PATCH v2 4/4] dt: paz00: define nvec as child of i2c bus
Date: Mon, 30 Mar 2015 23:00:15 +0300
Message-ID: <1427745615-5428-5-git-send-email-danindrey@mail.ru>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Julian Andres Klode <jak@jak-linux.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Marc Dietrich <marvin24@gmx.de>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Andrey Danin <danindrey@mail.ru>
List-Id: linux-tegra@vger.kernel.org

NVEC driver was reimplemented to use tegra i2c. Use common i2c bindings
for NVEC node.

Signed-off-by: Andrey Danin <danindrey@mail.ru>
---
Changes for v2:
- swap reg and request-gpios properties
- use nvec-slave instead of nvec to keep ABI compatibility
- place doc in separate patch

---
 arch/arm/boot/dts/tegra20-paz00.dts | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ed7e100..cd5e6ef 100644
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
+			compatible = "nvidia,nvec-slave";
+			reg = <0x45>;
+			request-gpios = <&gpio TEGRA_GPIO(V, 2)
+				GPIO_ACTIVE_HIGH>;
+		};
 	};
 
 	i2c@7000d000 {
-- 
1.9.1
