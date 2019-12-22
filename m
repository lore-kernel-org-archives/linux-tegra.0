From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 12/13] arm64: tegra: Add external memory controller on Tegra186
Date: Sun, 22 Dec 2019 15:10:34 +0100
Message-ID: <20191222141035.1649937-13-thierry.reding@gmail.com>
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

Add the external memory controller as a child device of the memory
controller on Tegra186. The memory controller really represents the
memory subsystem that encompasses both the memory and external memory
controllers. The external memory controller uses the BPMP to obtain the
list of supported EMC frequencies and set the EMC frequency.

Also set up the dma-ranges property to describe that all memory clients
can address up to 40 bits using the memory controller client interface
(MCCIF), unless otherwise limited by the DMA engines of the hardware.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 584498a999d4..dba7f57469c5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -144,6 +144,27 @@ memory-controller@2c00000 {
 		reg = <0x0 0x02c00000 0x0 0xb0000>;
 		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
 		status = "disabled";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x0 0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
+
+		/*
+		 * Memory clients have access to all 40 bits that the memory
+		 * controller can address.
+		 */
+		dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
+
+		emc: external-memory-controller@2c60000 {
+			compatible = "nvidia,tegra186-emc";
+			reg = <0x0 0x02c60000 0x0 0x50000>;
+			interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA186_CLK_EMC>;
+			clock-names = "emc";
+
+			nvidia,bpmp = <&bpmp>;
+		};
 	};
 
 	timer@3010000 {
-- 
2.24.1
