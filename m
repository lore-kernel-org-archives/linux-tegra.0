From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v5 06/16] ARM: tegra: harmony: Initialize PCIe from DT
Date: Thu, 25 Jul 2013 10:53:20 -0700
Message-ID: <1374774810-18459-7-git-send-email-thierry.reding@gmail.com>
References: <1374774810-18459-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374774810-18459-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <bhelgaas@google.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Jay Agarwal <jagarwal@nvidia.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@avionic-design.de>

With the device tree support in place, probe the PCIe controller from
the device tree and remove the corresponding workaround in the board
file.

Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20-harmony.dts | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index d9f89cd..8724dc7 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -335,7 +335,7 @@
 					regulator-always-on;
 				};
 
-				ldo0 {
+				pci_clk_reg: ldo0 {
 					regulator-name = "vdd_ldo0,vddio_pex_clk";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
@@ -425,6 +425,20 @@
 		nvidia,sys-clock-req-active-high;
 	};
 
+	pcie-controller {
+		pex-clk-supply = <&pci_clk_reg>;
+		vdd-supply = <&pci_vdd_reg>;
+		status = "okay";
+
+		pci@1,0 {
+			status = "okay";
+		};
+
+		pci@2,0 {
+			status = "okay";
+		};
+	};
+
 	usb@c5000000 {
 		status = "okay";
 	};
@@ -643,7 +657,7 @@
 			enable-active-high;
 		};
 
-		regulator@3 {
+		pci_vdd_reg: regulator@3 {
 			compatible = "regulator-fixed";
 			reg = <3>;
 			regulator-name = "vdd_1v05";
@@ -651,8 +665,6 @@
 			regulator-max-microvolt = <1050000>;
 			gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
-			/* Hack until board-harmony-pcie.c is removed */
-			status = "disabled";
 		};
 
 		regulator@4 {
-- 
1.8.1.5
