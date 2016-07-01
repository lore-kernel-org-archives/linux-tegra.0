From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Enable XUSB controller on Tegra210 Smaug
Date: Fri, 1 Jul 2016 17:04:03 +0100
Message-ID: <1467389043-959-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable the XUSB controller on Tegra210 Smaug. The Smaug has a USB Type-C
connector with one of the USB2.0 lanes and one of the USB3.0 lanes
populated.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 431266a48e9c..db9763fd945f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1568,6 +1568,63 @@
 		status = "okay";
 	};
 
+	usb@70090000 {
+		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>,
+		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-6}>;
+		phy-names = "usb2-0", "usb3-0";
+
+		dvddio-pex-supply = <&avddio_1v05>;
+		hvddio-pex-supply = <&pp1800>;
+		avdd-usb-supply = <&pp3300>;
+		avdd-pll-utmip-supply = <&pp1800>;
+		avdd-pll-uerefe-supply = <&pp1050_avdd>;
+		dvdd-pex-pll-supply = <&avddio_1v05>;
+		hvdd-pex-pll-e-supply = <&pp1800>;
+
+		status = "okay";
+	};
+
+	padctl@7009f000 {
+		status = "okay";
+
+		pads {
+			usb2 {
+				status = "okay";
+
+				lanes {
+					usb2-0 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+				};
+			};
+
+			pcie {
+				status = "okay";
+
+				lanes {
+					pcie-6 {
+						nvidia,function = "usb3-ss";
+						status = "okay";
+					};
+				};
+			};
+		};
+
+		ports {
+			usb2-0 {
+				status = "okay";
+				vbus-supply = <&usbc_vbus>;
+				mode = "otg";
+			};
+
+			usb3-0 {
+				nvidia,usb2-companion = <0>;
+				status = "okay";
+			};
+		};
+	};
+
 	sdhci@700b0600 {
 		bus-width = <8>;
 		non-removable;
-- 
2.1.4
