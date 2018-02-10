From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 3/6] ARM: dts: tegra: apalis-tk1: add missing as3722 gpio0
 configuration
Date: Sat, 10 Feb 2018 02:38:03 +0100
Message-ID: <20180210013806.28496-4-marcel@ziswiler.com>
References: <20180210013806.28496-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180210013806.28496-1-marcel@ziswiler.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

As the AS3722 GPIO0 is also a not connected on our Apalis TK1 module
explicitly configure it to high-impedance as well.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-apalis.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 7fbaaf221029..44c31176ce90 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1620,9 +1620,9 @@
 					bias-pull-up;
 				};
 
-				gpio1_3_4_5_6 {
-					pins = "gpio1", "gpio3", "gpio4",
-					       "gpio5", "gpio6";
+				gpio0_1_3_4_5_6 {
+					pins = "gpio0", "gpio1", "gpio3",
+					       "gpio4", "gpio5", "gpio6";
 					bias-high-impedance;
 				};
 			};
-- 
2.14.3
