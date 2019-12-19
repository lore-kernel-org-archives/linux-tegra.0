From: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 2/2] ARM: dts: tegra20: add labels to host1x its subnodes
Date: Thu, 19 Dec 2019 14:04:31 +0100
Message-ID: <20191219130431.30458-2-richard.leitner@skidata.com>
References: <20191219130431.30458-1-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191219130431.30458-1-richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
List-Id: linux-tegra@vger.kernel.org

Add labels to the host1x, dc and hdmi nodes of the Tegra20 SoC so we
just need to alias it from derived boards.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index e02f75757a7e..c569bd87550f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -29,7 +29,7 @@
 		};
 	};
 
-	host1x@50000000 {
+	host1x: host1x@50000000 {
 		compatible = "nvidia,tegra20-host1x", "simple-bus";
 		reg = <0x50000000 0x00024000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
@@ -96,7 +96,7 @@
 			reset-names = "3d";
 		};
 
-		dc@54200000 {
+		dc1: dc@54200000 {
 			compatible = "nvidia,tegra20-dc";
 			reg = <0x54200000 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -113,7 +113,7 @@
 			};
 		};
 
-		dc@54240000 {
+		dc2: dc@54240000 {
 			compatible = "nvidia,tegra20-dc";
 			reg = <0x54240000 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
@@ -130,7 +130,7 @@
 			};
 		};
 
-		hdmi@54280000 {
+		hdmi: hdmi@54280000 {
 			compatible = "nvidia,tegra20-hdmi";
 			reg = <0x54280000 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.21.0
