From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 11/14] ARM: tegra: Enable VDE on Tegra124
Date: Mon, 13 Aug 2018 16:50:24 +0200
Message-ID: <20180813145027.16346-12-thierry.reding@gmail.com>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180813145027.16346-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index b113e47b2b2a..8fdca4723205 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -83,6 +83,19 @@
 		};
 	};
 
+	iram@40000000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x40000000 0x0 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0x40000000 0x40000>;
+
+		vde_pool: pool@400 {
+			reg = <0x400 0x3fc00>;
+			pool;
+		};
+	};
+
 	host1x@50000000 {
 		compatible = "nvidia,tegra124-host1x", "simple-bus";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
@@ -283,6 +296,33 @@
 		*/
 	};
 
+	vde@60030000 {
+		compatible = "nvidia,tegra124-vde", "nvidia,tegra30-vde",
+			     "nvidia,tegra20-vde";
+		reg = <0x0 0x60030000 0x0 0x1000   /* Syntax Engine */
+		       0x0 0x60031000 0x0 0x1000   /* Video Bitstream Engine */
+		       0x0 0x60032000 0x0 0x0100   /* Macroblock Engine */
+		       0x0 0x60032200 0x0 0x0100   /* Post-processing Engine */
+		       0x0 0x60032400 0x0 0x0100   /* Motion Compensation Engine */
+		       0x0 0x60032600 0x0 0x0100   /* Transform Engine */
+		       0x0 0x60032800 0x0 0x0100   /* Pixel prediction block */
+		       0x0 0x60032a00 0x0 0x0100   /* Video DMA */
+		       0x0 0x60033800 0x0 0x0400>; /* Video frame controls */
+		reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
+			    "tfe", "ppb", "vdma", "frameid";
+		iram = <&vde_pool>; /* IRAM region */
+		interrupts = <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
+		interrupt-names = "sync-token", "bsev", "sxe";
+		clocks = <&tegra_car TEGRA124_CLK_VDE>,
+			 <&tegra_car TEGRA124_CLK_BSEV>;
+		clock-names = "vde", "bsev";
+		resets = <&tegra_car 61>,
+			 <&tegra_car 63>;
+		reset-names = "vde", "bsev";
+	};
+
 	apbdma: dma@60020000 {
 		compatible = "nvidia,tegra124-apbdma", "nvidia,tegra148-apbdma";
 		reg = <0x0 0x60020000 0x0 0x1400>;
-- 
2.17.0
