From: Thierry Reding <thierry.reding@gmail.com>
Subject: [RFC 3/5] ARM: tegra: Enable UDC on Beaver
Date: Thu, 26 May 2016 17:40:03 +0200
Message-ID: <20160526154005.11558-4-thierry.reding@gmail.com>
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
 arch/arm/boot/dts/tegra30-beaver.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 4ea3ecc10934..5f32bcd96fbc 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1935,6 +1935,17 @@
 		non-removable;
 	};
 
+	usb@7d000000 {
+		compatible = "nvidia,tegra30-udc";
+		status = "okay";
+		dr_mode = "otg";
+	};
+
+	usb-phy@7d000000 {
+		status = "okay";
+		dr_mode = "otg";
+	};
+
 	usb@7d004000 {
 		status = "okay";
 	};
-- 
2.8.3
