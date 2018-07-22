From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 03/28] ARM: tegra: apalis_t30: pull-up sd card detect pins
Date: Sun, 22 Jul 2018 18:49:11 +0200
Message-ID: <20180722164936.20581-4-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

In order to avoid any floating SD card detect pins as may e.g. happen on
Ixora V1.1A pull them all up.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index e7f3dd52a209..f4dc7e77114f 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -194,7 +194,7 @@
 			pv3 {
 				nvidia,pins = "pv3";
 				nvidia,function = "rsvd2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
@@ -260,7 +260,7 @@
 			clk2_req_pcc5 {
 				nvidia,pins = "clk2_req_pcc5";
 				nvidia,function = "rsvd2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
-- 
2.14.4
