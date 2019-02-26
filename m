From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Add supply for temperature sensor on P2888
Date: Tue, 26 Feb 2019 16:07:55 +0000
Message-ID: <1551197275-8977-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The VCC supply property is not populated for the temperature sensor on
the P2888 board and so the following warning is observed on boot ...

 lm90 0-004c: 0-004c supply vcc not found, using dummy regulator

On the P2888 board, the VCC supply for the temperature sensor is
connected to the 'vdd_1v8ls' rail. Add the 'vcc-supply' property for
the temperature sensor to prevent this warning message from occurring.

Fixes: 8b457812f54b ('arm64: tegra: Add temperature sensor on P2888')

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 246c1ebbd055..0fd5bd29fbf9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -256,6 +256,7 @@
 				interrupt-parent = <&gpio>;
 				interrupts = <TEGRA194_MAIN_GPIO(H, 2)
 					      IRQ_TYPE_LEVEL_LOW>;
+				vcc-supply = <&vdd_1v8ls>;
 
 				#thermal-sensor-cells = <1>;
 			};
-- 
2.7.4
