From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 02/26] ARM: tegra: colibri_t30: add local-mac-address property
Date: Mon, 23 Jul 2018 14:36:33 +0200
Message-ID: <20180723123658.980-3-marcel@ziswiler.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add empty local-mac-address property to be filled in by boot loader
(e.g. U-Boot).

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-colibri.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 6293422c977a..5cceb69743bc 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -445,6 +445,13 @@
 	/* EHCI instance 1: USB2_DP/N -> AX88772B */
 	usb@7d004000 {
 		status = "okay";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		asix@1 {
+			reg = <1>;
+			local-mac-address = [00 00 00 00 00 00];
+		};
 	};
 
 	usb-phy@7d004000 {
-- 
2.14.4
