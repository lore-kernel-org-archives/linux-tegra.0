From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] arm64: tegra: Fix base address for SOR1 on Tegra194
Date: Fri, 26 Jul 2019 12:16:18 +0200
Message-ID: <20190726101618.26896-3-thierry.reding@gmail.com>
References: <20190726101618.26896-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190726101618.26896-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SOR1 hardware block's registers start at physical address 0x15b40000
as correctly specified by the unit-address, but the reg property lists a
wrong value, likely because it was copy-and-pasted from SOR0 but not
correctly updated.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 923415fd72a4..ca5ffbc79e2f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1045,7 +1045,7 @@
 
 			sor1: sor@15b40000 {
 				compatible = "nvidia,tegra194-sor";
-				reg = <0x155c0000 0x40000>;
+				reg = <0x15b40000 0x40000>;
 				interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_SOR1_REF>,
 					 <&bpmp TEGRA194_CLK_SOR1_OUT>,
-- 
2.22.0
