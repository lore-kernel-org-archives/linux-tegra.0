From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 3/3] ARM: dts: tegra: apalis/colibri: remove unneeded reg
 property
Date: Sat, 10 Feb 2018 02:36:38 +0100
Message-ID: <20180210013638.28164-4-marcel@ziswiler.com>
References: <20180210013638.28164-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180210013638.28164-1-marcel@ziswiler.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

As described in
Documentation/devicetree/bindings/input/touchscreen/stmpe.txt there is
no 'reg' property under stmpe_touchscreen, so remove it to fix the
following build warning with W=1:

arch/arm/boot/dts/tegra30-apalis-eval.dtb:
Warning (unit_address_vs_reg): Node
/i2c@7000d000/stmpe811@41/stmpe_touchscreen has a reg or ranges
property, but no unit name

Similar to commit 89277e8e2679 ("ARM: dts: imx6qdl-apalis: Remove
unneeded reg property").

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis.dtsi  | 1 -
 arch/arm/boot/dts/tegra30-colibri.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 676a4c4b1512..d1d21ec2a844 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -597,7 +597,6 @@
 
 			stmpe_touchscreen@0 {
 				compatible = "st,stmpe-ts";
-				reg = <0>;
 				/* 3.25 MHz ADC clock speed */
 				st,adc-freq = <1>;
 				/* 8 sample average control */
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 1f77273521bf..c44d8c40c410 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -363,7 +363,6 @@
 
 			stmpe_touchscreen {
 				compatible = "st,stmpe-ts";
-				reg = <0>;
 				/* 3.25 MHz ADC clock speed */
 				st,adc-freq = <1>;
 				/* 8 sample average control */
-- 
2.14.3
