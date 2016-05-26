From: Thierry Reding <thierry.reding@gmail.com>
Subject: [RFC 4/5] ARM: tegra: Enable UDC on Dalmore
Date: Thu, 26 May 2016 17:40:04 +0200
Message-ID: <20160526154005.11558-5-thierry.reding@gmail.com>
References: <20160526154005.11558-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160526154005.11558-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Override the compatible string of the first USB controller to enable
device mode.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index c970bf65c74c..53d664f718ff 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1122,6 +1122,17 @@
 		non-removable;
 	};
 
+	usb@7d000000 {
+		compatible = "nvidia,tegra114-udc";
+		status = "okay";
+		dr_mode = "otg";
+	};
+
+	usb-phy@7d000000 {
+		status = "okay";
+		dr_mode = "otg";
+	};
+
 	usb@7d008000 {
 		status = "okay";
 	};
-- 
2.8.3
