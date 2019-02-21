From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V7 5/8] arm64: tegra: add CPU idle states properties for
 Tegra210
Date: Thu, 21 Feb 2019 15:21:47 +0800
Message-ID: <20190221072150.4395-6-josephl@nvidia.com>
References: <20190221072150.4395-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190221072150.4395-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add idle states properties for generic ARM CPU idle driver. This
includes a cpu-sleep state which is the power down state of CPU cores.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
v7:
 * s/C7/CPU_SLEEP/ & s/c7/cpu-sleep/
 * update the timing of 'entry/exit-latency-us'
v6:
 * add ack tag from Jon.
v5:
 * no change
v4:
 * no change
v3:
 * no change
v2:
 * add entry-latency-us and exit-latency-us properties
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index abbb686bd8ba..79cedd36ffad 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1371,24 +1371,43 @@
 				 <&dfll>;
 			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
 			clock-latency = <300000>;
+			cpu-idle-states = <&CPU_SLEEP>;
 		};
 
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
 			reg = <1>;
+			cpu-idle-states = <&CPU_SLEEP>;
 		};
 
 		cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
 			reg = <2>;
+			cpu-idle-states = <&CPU_SLEEP>;
 		};
 
 		cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
 			reg = <3>;
+			cpu-idle-states = <&CPU_SLEEP>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			CPU_SLEEP: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x40000007>;
+				entry-latency-us = <100>;
+				exit-latency-us = <30>;
+				min-residency-us = <1000>;
+				wakeup-latency-us = <130>;
+				idle-state-name = "cpu-sleep";
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.20.1
