From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 01/20] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
Date: Fri, 4 Jan 2019 11:06:43 +0800
Message-ID: <20190104030702.8684-2-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Peter De Schrijver <pdeschrijver@nvidia.com>

Add new properties to configure the DFLL PWM regulator support.

Cc: devicetree@vger.kernel.org
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V4:
 - s/nvidia,pwm-period/nvidia,pwm-period-nanoseconds/
*V3:
 - no change
*V2:
 - update the binding strings and descriptions for
 nvidia,pwm-tristate-microvolts
 nvidia,pwm-min-microvolts
 nvidia,pwm-voltage-step-microvolts
---
 .../bindings/clock/nvidia,tegra124-dfll.txt   | 79 ++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
index dff236f524a7..5558bb5fcf2c 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
@@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage controlled
 oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
 control module that will automatically adjust the VDD_CPU voltage by
 communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
-Currently only the I2C mode is supported by these bindings.
 
 Required properties:
 - compatible : should be "nvidia,tegra124-dfll"
@@ -45,10 +44,31 @@ Required properties for the control loop parameters:
 Optional properties for the control loop parameters:
 - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
 
+Optional properties for mode selection:
+- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
+
 Required properties for I2C mode:
 - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
 
-Example:
+Required properties for PWM mode:
+- nvidia,pwm-period-nanoseconds: period of PWM square wave in nanoseconds.
+- nvidia,pwm-tristate-microvolts: Regulator voltage in micro volts when PWM
+  control is disabled and the PWM output is tristated. Note that this voltage is
+  configured in hardware, typically via a resistor divider.
+- nvidia,pwm-min-microvolts: Regulator voltage in micro volts when PWM control
+  is enabled and PWM output is low. Hence, this is the minimum output voltage
+  that the regulator supports when PWM control is enabled.
+- nvidia,pwm-voltage-step-microvolts: Voltage increase in micro volts
+  corresponding to a 1/33th increase in duty cycle. Eg the voltage for 2/33th
+  duty cycle would be: nvidia,pwm-min-microvolts +
+  nvidia,pwm-voltage-step-microvolts * 2.
+- pinctrl-0: I/O pad configuration when PWM control is enabled.
+- pinctrl-1: I/O pad configuration when PWM control is disabled.
+- pinctrl-names: must include the following entries:
+  - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
+  - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
+
+Example for I2C:
 
 clock@70110000 {
         compatible = "nvidia,tegra124-dfll";
@@ -76,3 +96,58 @@ clock@70110000 {
 
         nvidia,i2c-fs-rate = <400000>;
 };
+
+Example for PWM:
+
+clock@70110000 {
+	compatible = "nvidia,tegra124-dfll";
+	reg = <0 0x70110000 0 0x100>, /* DFLL control */
+	      <0 0x70110000 0 0x100>, /* I2C output control */
+	      <0 0x70110100 0 0x100>, /* Integrated I2C controller */
+	      <0 0x70110200 0 0x100>; /* Look-up table RAM */
+	interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&tegra_car TEGRA210_CLK_DFLL_SOC>,
+	         <&tegra_car TEGRA210_CLK_DFLL_REF>,
+		 <&tegra_car TEGRA124_CLK_I2C5>;;
+	clock-names = "soc", "ref", "i2c";
+	resets = <&tegra_car TEGRA124_RST_DFLL_DVCO>;
+	reset-names = "dvco";
+	#clock-cells = <0>;
+	clock-output-names = "dfllCPU_out";
+
+	nvidia,sample-rate = <25000>;
+	nvidia,droop-ctrl = <0x00000f00>;
+	nvidia,force-mode = <1>;
+	nvidia,cf = <6>;
+	nvidia,ci = <0>;
+	nvidia,cg = <2>;
+
+	nvidia,pwm-min-microvolts = <708000>; /* 708mV */
+	nvidia,pwm-period-nanoseconds = <2500>; /* 2.5us */
+	nvidia,pwm-to-pmic;
+	nvidia,pwm-tristate-microvolts = <1000000>;
+	nvidia,pwm-voltage-step-microvolts = <19200>; /* 19.2mV */
+
+	pinctrl-names = "dvfs_pwm_enable", "dvfs_pwm_disable";
+	pinctrl-0 = <&dvfs_pwm_active_state>;
+	pinctrl-1 = <&dvfs_pwm_inactive_state>;
+};
+
+/* pinmux nodes added for completeness. Binding doc can be found in:
+ * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
+ */
+
+pinmux: pinmux@700008d4 {
+	dvfs_pwm_active_state: dvfs_pwm_active {
+		dvfs_pwm_pbb1 {
+			nvidia,pins = "dvfs_pwm_pbb1";
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		};
+	};
+	dvfs_pwm_inactive_state: dvfs_pwm_inactive {
+		dvfs_pwm_pbb1 {
+			nvidia,pins = "dvfs_pwm_pbb1";
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+		};
+	};
+};
-- 
2.20.1
