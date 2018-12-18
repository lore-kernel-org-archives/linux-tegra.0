From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 03/20] dt-bindings: cpufreq: tegra124: remove
 vdd-cpu-supply from required properties
Date: Tue, 18 Dec 2018 17:12:15 +0800
Message-ID: <20181218091232.23532-4-josephl@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181218091232.23532-1-josephl@nvidia.com>
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

The Tegra124 cpufreq driver works only with DFLL clock, which is a
hardware-based frequency/voltage controller. The driver doesn't need to
control the regulator itself. Hence remove that.

Cc: devicetree@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V3:
 - no change
*V2:
 - add ack tag
---
 .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt     | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
index b1669fbfb740..031545a29caf 100644
--- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
+++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
@@ -13,7 +13,6 @@ Required properties:
   - pll_x: Fast PLL clocksource.
   - pll_p: Auxiliary PLL used during fast PLL rate changes.
   - dfll: Fast DFLL clocksource that also automatically scales CPU voltage.
-- vdd-cpu-supply: Regulator for CPU voltage
 
 Optional properties:
 - clock-latency: Specify the possible maximum transition latency for clock,
@@ -37,7 +36,6 @@ cpus {
 			 <&dfll>;
 		clock-names = "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
 		clock-latency = <300000>;
-		vdd-cpu-supply: <&vdd_cpu>;
 	};
 
 	<...>
-- 
2.20.1
