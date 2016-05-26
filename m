From: Thierry Reding <thierry.reding@gmail.com>
Subject: [RFC 2/5] ARM: tegra: Enable UDC on TrimSlice
Date: Thu, 26 May 2016 17:40:02 +0200
Message-ID: <20160526154005.11558-3-thierry.reding@gmail.com>
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
 arch/arm/boot/dts/tegra20-trimslice.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 4a035f74043a..5496f3dc089c 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -336,11 +336,14 @@
 	};
 
 	usb@c5000000 {
+		compatible = "nvidia,tegra20-udc";
 		status = "okay";
+		dr_mode = "otg";
 	};
 
 	usb-phy@c5000000 {
 		status = "okay";
+		dr_mode = "otg";
 		vbus-supply = <&vbus_reg>;
 	};
 
-- 
2.8.3
