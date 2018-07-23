From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 25/26] ARM: tegra: colibri_t30: annotate ehci instance 1
Date: Mon, 23 Jul 2018 14:36:56 +0200
Message-ID: <20180723123658.980-26-marcel@ziswiler.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate EHCI instance 1 (USB2_DP/N) connecting to ASIX AX88772B USB to
Ethernet chip being on-module.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index d3f72e567d5a..e10e0f2b6034 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -939,7 +939,7 @@
 		};
 	};
 
-	/* EHCI instance 1: USB2_DP/N -> AX88772B */
+	/* EHCI instance 1: USB2_DP/N -> AX88772B (On-module) */
 	usb@7d004000 {
 		status = "okay";
 		#address-cells = <1>;
-- 
2.14.4
