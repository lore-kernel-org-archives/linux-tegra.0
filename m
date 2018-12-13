From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 16/21] arm64: dts: tegra210: add CPU clocks
Date: Thu, 13 Dec 2018 17:34:33 +0800
Message-ID: <20181213093438.29621-17-josephl@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181213093438.29621-1-josephl@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add CPU clocks for Tegra210.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V2:
 - add ack tag
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index a6db62157442..e2baf52fe1af 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1304,6 +1304,12 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
 			reg = <0>;
+			clocks = <&tegra_car TEGRA210_CLK_CCLK_G>,
+				 <&tegra_car TEGRA210_CLK_PLL_X>,
+				 <&tegra_car TEGRA210_CLK_PLL_P_OUT4>,
+				 <&dfll>;
+			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
+			clock-latency = <300000>;
 		};
 
 		cpu@1 {
-- 
2.19.2
