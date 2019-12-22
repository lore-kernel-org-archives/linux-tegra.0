From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 13/13] arm64: tegra: Add the memory subsystem on Tegra194
Date: Sun, 22 Dec 2019 15:10:35 +0100
Message-ID: <20191222141035.1649937-14-thierry.reding@gmail.com>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191222141035.1649937-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The memory subsystem on Tegra194 encompasses both the memory and
external memory controllers. The EMC is represented as a subnode of the
MC and a ranges property is used to describe the register ranges.

A dma-ranges property is also added to describe that all memory clients
can address up to 39 bits using the memory controller client interface
(MCCIF), unless otherwise limited by the DMA engines of the hardware. A
memory client can technically use 40 bits of addresses, but the memory
controller on Tegra194 uses bit 39 to determine the XBAR format used to
access memory. Use of this bit needs to be explicitly controlled by the
operating system drivers for devices that can use this on-the-fly format
conversion. Using the dma-ranges property prevents the operating system
from using the bit implicitly, for example in I/O virtual address
mappings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  4 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 43 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index b6ffd5dde20d..cc23d59240ac 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -48,6 +48,10 @@ phy: phy@0 {
 			};
 		};
 
+		memory-controller@2c00000 {
+			status = "okay";
+		};
+
 		serial@3110000 {
 			status = "okay";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 9f000bb7fca7..73e23ca158dc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/power/tegra194-powergate.h>
 #include <dt-bindings/reset/tegra194-reset.h>
 #include <dt-bindings/thermal/tegra194-bpmp-thermal.h>
+#include <dt-bindings/memory/tegra194-mc.h>
 
 / {
 	compatible = "nvidia,tegra194";
@@ -166,6 +167,48 @@ clkreq {
 			};
 		};
 
+		mc: memory-controller@2c00000 {
+			compatible = "nvidia,tegra194-mc";
+			reg = <0x02c00000 0x100000>,
+			      <0x02b80000 0x040000>,
+			      <0x01700000 0x100000>;
+			status = "disabled";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			ranges = <0x01700000 0x0 0x01700000 0x0 0x100000>,
+				 <0x02b80000 0x0 0x02b80000 0x0 0x040000>,
+				 <0x02c00000 0x0 0x02c00000 0x0 0x100000>;
+
+			/*
+			 * Bit 39 of addresses passing through the memory
+			 * controller selects the XBAR format used when memory
+			 * is accessed. This is used to transparently access
+			 * memory in the XBAR format used by the discrete GPU
+			 * (bit 39 set) or Tegra (bit 39 clear).
+			 *
+			 * As a consequence, the operating system must ensure
+			 * that bit 39 is never used implicitly, for example
+			 * via an I/O virtual address mapping of an IOMMU. If
+			 * devices require access to the XBAR switch, their
+			 * drivers must set this bit explicitly.
+			 *
+			 * Limit the DMA range for memory clients to [38:0].
+			 */
+			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
+
+			emc: external-memory-controller@2c60000 {
+				compatible = "nvidia,tegra194-emc";
+				reg = <0x0 0x02c60000 0x0 0x90000>,
+				      <0x0 0x01780000 0x0 0x80000>;
+				clocks = <&bpmp TEGRA194_CLK_EMC>;
+				clock-names = "emc";
+
+				nvidia,bpmp = <&bpmp>;
+			};
+		};
+
 		uarta: serial@3100000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
 			reg = <0x03100000 0x40>;
-- 
2.24.1
