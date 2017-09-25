From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] ARM: dts: tegra20: Add video decoder node
Date: Tue, 26 Sep 2017 01:15:43 +0300
Message-ID: <ce6e7ed98e64688517d9f912e9c6e848169d0d3c.1506377430.git.digetx@gmail.com>
References: <cover.1506377430.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cover.1506377430.git.digetx@gmail.com>
In-Reply-To: <cover.1506377430.git.digetx@gmail.com>
References: <cover.1506377430.git.digetx@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add a device node for the video decoder engine found on Tegra20.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 7c85f97f72ea..fb485a5e63d7 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -249,6 +249,22 @@
 		*/
 	};
 
+	vde@6001a000 {
+		compatible = "nvidia,tegra20-vde";
+		reg = <0x6001a000 0x3D00    /* VDE registers */
+		       0x40000400 0x3FC00>; /* IRAM area */
+		reg-names = "regs", "iram";
+		interrupts = <GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>, /* UCQ error interrupt */
+			     <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>, /* BSE-A interrupt */
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
+		interrupt-names = "ucq-error", "sync-token", "bsev", "bsea", "sxe";
+		clocks = <&tegra_car TEGRA20_CLK_VDE>;
+		resets = <&tegra_car 61>;
+		reset-names = "vde";
+	};
+
 	apbmisc@70000800 {
 		compatible = "nvidia,tegra20-apbmisc";
 		reg = <0x70000800 0x64   /* Chip revision */
-- 
2.14.1
