From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 24/34] ARM: tegra: colibri_t30: annotate ehci instance 1
Date: Sat,  1 Sep 2018 10:12:38 +0200
Message-ID: <20180901081248.22639-25-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate EHCI instance 1 (USB2_DP/N) connecting to ASIX AX88772B USB to
Ethernet chip being on-module.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 1337674c530c..7a4e454a1960 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -939,7 +939,7 @@
 		mmc-ddr-1_8v;
 	};
 
-	/* EHCI instance 1: USB2_DP/N -> AX88772B */
+	/* EHCI instance 1: USB2_DP/N -> AX88772B (On-module) */
 	usb@7d004000 {
 		status = "okay";
 		#address-cells = <1>;
-- 
2.14.4
