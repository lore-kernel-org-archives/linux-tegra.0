From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 4/6] arm64: dts: tegra210: add CPU idle states properties
Date: Mon, 7 Jan 2019 11:28:08 +0800
Message-ID: <20190107032810.13522-5-josephl@nvidia.com>
References: <20190107032810.13522-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190107032810.13522-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add idle states properties for generic ARM CPU idle driver. This
includes a C7 state which is the power down state of CPU cores.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
Note:
This dt patch depends on the DT changes in below series.
http://patchwork.ozlabs.org/project/linux-tegra/list/?series=84380
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 143bd103c923..b583d3065946 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1308,24 +1308,41 @@
 				 <&dfll>;
 			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
 			clock-latency = <300000>;
+			cpu-idle-states = <&C7>;
 		};
 
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
 			reg = <1>;
+			cpu-idle-states = <&C7>;
 		};
 
 		cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
 			reg = <2>;
+			cpu-idle-states = <&C7>;
 		};
 
 		cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
 			reg = <3>;
+			cpu-idle-states = <&C7>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			C7: c7 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x40000007>;
+				wakeup-latency-us = <130>;
+				min-residency-us = <1000>;
+				idle-state-name = "c7-cpu-powergated";
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.20.1
