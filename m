From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 15/28] ARM: tegra: apalis_t30: move dr_mode property from phy to controller
Date: Sun, 22 Jul 2018 18:49:23 +0200
Message-ID: <20180722164936.20581-16-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Move dr_mode property from USB PHY node to controller.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index a1ae4c3ee39c..4bb571bffc7f 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -163,11 +163,11 @@
 	/* EHCI instance 0: USB1_DP/N -> USBO1_DP/N */
 	usb@7d000000 {
 		status = "okay";
+		dr_mode = "otg";
 	};
 
 	usb-phy@7d000000 {
 		status = "okay";
-		dr_mode = "otg";
 		vbus-supply = <&reg_usbo1_vbus>;
 	};
 
-- 
2.14.4
