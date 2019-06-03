From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 5/8] dt-bindings: regulator: Document regulators coupling of NVIDIA Tegra20/30 SoC's
Date: Tue,  4 Jun 2019 02:59:01 +0300
Message-ID: <20190603235904.19097-6-digetx@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603235904.19097-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is voltage coupling between three regulators on Tegra20 boards and
between two on Tegra30. The voltage coupling is a SoC-level feature and
thus it is mandatory and common for all of the Tegra boards.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../nvidia,tegra-regulators-coupling.txt      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt

diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
new file mode 100644
index 000000000000..4bf2dbf7c6cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
@@ -0,0 +1,65 @@
+NVIDIA Tegra Regulators Coupling
+================================
+
+NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulators.
+Thus on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30
+there are 2.
+
+Tegra20 voltage coupling
+------------------------
+
+On Tegra20 SoC's there are 3 coupled regulators: CORE, RTC and CPU.
+The CORE and RTC voltages shall be in a range of 170mV from each other
+and they both shall be higher than the CPU voltage by at least 120mV.
+
+Tegra30 voltage coupling
+------------------------
+
+On Tegra30 SoC's there are 2 coupled regulators: CORE and CPU. The CORE
+and CPU voltages shall be in a range of 300mV from each other and CORE
+voltage shall be higher than the CPU by N mV, where N depends on the CPU
+voltage.
+
+Required properties:
+- nvidia,tegra-core-regulator: Boolean property that designates regulator
+  as the "Core domain" voltage regulator.
+- nvidia,tegra-rtc-regulator: Boolean property that designates regulator
+  as the "RTC domain" voltage regulator.
+- nvidia,tegra-cpu-regulator: Boolean property that designates regulator
+  as the "CPU domain" voltage regulator.
+
+Example:
+
+	pmic {
+		regulators {
+			core_vdd_reg: core {
+				regulator-name = "vdd_core";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
+				regulator-coupled-max-spread = <170000 550000>;
+
+				nvidia,tegra-core-regulator;
+			};
+
+			rtc_vdd_reg: rtc {
+				regulator-name = "vdd_rtc";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
+				regulator-coupled-max-spread = <170000 550000>;
+
+				nvidia,tegra-rtc-regulator;
+			};
+
+			cpu_vdd_reg: cpu {
+				regulator-name = "vdd_cpu";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1125000>;
+				regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
+				regulator-coupled-max-spread = <550000 550000>;
+
+				nvidia,tegra-cpu-regulator;
+			};
+		};
+	};
-- 
2.21.0
