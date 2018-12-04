From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 17/19] arm64: dts: tegra210-smaug: add CPU power rail regulator
Date: Tue, 4 Dec 2018 17:25:46 +0800
Message-ID: <20181204092548.3038-18-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
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

Add CPU power rail regulator for Smaug board.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 43cae4798870..b3930a9dd139 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1340,6 +1340,25 @@
 		status = "okay";
 		clock-frequency = <1000000>;
 
+		max77621_cpu: max77621@1b {
+			compatible = "maxim,max77621";
+			reg = <0x1b>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(Y, 1) IRQ_TYPE_LEVEL_LOW>;
+			regulator-name = "PPVAR_CPU";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <1231250>;
+			regulator-ramp-delay = <12500>;
+			regulator-boot-on;
+			regulator-always-on;
+			maxim,dvs-default-state = <1>;
+			maxim,enable-active-discharge;
+			maxim,enable-bias-control;
+			maxim,enable-etr;
+			maxim,enable-gpio = <&max77620 5 0>;
+			maxim,externally-enable;
+		};
+
 		max77620: max77620@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
-- 
2.19.2
