From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 21/37] ARM: tegra: colibri_t20: iris: add dr_mode property
Date: Sun,  2 Sep 2018 12:08:50 +0200
Message-ID: <20180902100906.25792-22-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add dr_mode property to the USB controller.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 5b25e4b38a69..7a7530820188 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -145,6 +145,7 @@
 	/* EHCI instance 0: USB1_DP/N -> USBC_P/N */
 	usb@c5000000 {
 		status = "okay";
+		dr_mode = "otg";
 	};
 
 	usb-phy@c5000000 {
-- 
2.14.4
