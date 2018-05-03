From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] ARM: tegra: apalis-tk1: fix high speed uart compatible
Date: Thu,  3 May 2018 09:46:46 +0200
Message-ID: <20180503074646.24300-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Turns out the compatible "nvidia,tegra124-hsuart" does not (yet) exit
and everybody else also uses it only in conjunction with
"nvidia,tegra30-hsuart".

Reported-by: Martin Šafařík <msafarik@retia.cz>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 6 +++---
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index bb67edb016c5..3455822350c5 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1536,15 +1536,15 @@
 	};
 
 	serial@70006040 {
-		compatible = "nvidia,tegra124-hsuart";
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
 	};
 
 	serial@70006200 {
-		compatible = "nvidia,tegra124-hsuart";
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
 	};
 
 	serial@70006300 {
-		compatible = "nvidia,tegra124-hsuart";
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
 	};
 
 	hdmi_ddc: i2c@7000c700 {
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 65a2161b9b8e..9f960c84ba10 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1565,15 +1565,15 @@
 	};
 
 	serial@70006040 {
-		compatible = "nvidia,tegra124-hsuart";
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
 	};
 
 	serial@70006200 {
-		compatible = "nvidia,tegra124-hsuart";
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
 	};
 
 	serial@70006300 {
-		compatible = "nvidia,tegra124-hsuart";
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
 	};
 
 	hdmi_ddc: i2c@7000c400 {
-- 
2.14.3
