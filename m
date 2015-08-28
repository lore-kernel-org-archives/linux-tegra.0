From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 07/11] arm: tegra: colibri_t30: activate stmpe811 touch
 controller
Date: Fri, 28 Aug 2015 17:59:42 +0200
Message-ID: <1440777586-19545-8-git-send-email-marcel.ziswiler@toradex.com>
References: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Activate STMPE811 touch controller as found on Colibri T30 modules.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 arch/arm/boot/dts/tegra30-colibri.dtsi | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index fba3d2a..5f8ec5c 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -320,6 +320,46 @@
 			};
 		};
 
+		/* STMPE811 touch screen controller */
+		stmpe811@41 {
+			compatible = "st,stmpe811";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x41>;
+			interrupts = <TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
+			interrupt-parent = <&gpio>;
+			interrupt-controller;
+			id = <0>;
+			blocks = <0x5>;
+			irq-trigger = <0x1>;
+
+			stmpe_touchscreen {
+				compatible = "st,stmpe-ts";
+				reg = <0>;
+				/* 3.25 MHz ADC clock speed */
+				st,adc-freq = <1>;
+				/* 8 sample average control */
+				st,ave-ctrl = <3>;
+				/* 7 length fractional part in z */
+				st,fraction-z = <7>;
+				/*
+				 * 50 mA typical 80 mA max touchscreen drivers
+				 * current limit value
+				 */
+				st,i-drive = <1>;
+				/* 12-bit ADC */
+				st,mod-12b = <1>;
+				/* internal ADC reference */
+				st,ref-sel = <0>;
+				/* ADC converstion time: 80 clocks */
+				st,sample-time = <4>;
+				/* 1 ms panel driver settling time */
+				st,settling = <3>;
+				/* 5 ms touch detect interrupt delay */
+				st,touch-det-delay = <5>;
+			};
+		};
+
 		/*
 		 * LM95245 temperature sensor
 		 * Note: OVERT_N directly connected to PMIC PWRDN
-- 
2.4.3
