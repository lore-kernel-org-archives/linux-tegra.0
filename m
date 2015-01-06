From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 1/4] ARM: tegra: rely on bootloader pinmux programming on
 nyan-big
Date: Tue,  6 Jan 2015 11:37:26 +0100
Message-ID: <1420540653-14816-2-git-send-email-tomeu.vizoso@collabora.com>
References: <1420540653-14816-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420540653-14816-1-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Following 6dbaff2b, the kernel expects that the bootloader has correctly
programmed the Tegra pinmux.

DTs for the Jetson and the Venice2 had been updated already but this one
was left behind.

Have tested this with the stock vendor firmware (coreboot) and have found no
issues.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 53181d3..4752572 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -44,10 +44,10 @@
 	};
 
 	pinmux@0,70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinmux_default>;
+		pinctrl-names = "boot";
+		pinctrl-0 = <&pinmux_boot>;
 
-		pinmux_default: common {
+		pinmux_boot: common {
 			dap_mclk1_pw4 {
 				nvidia,pins = "dap_mclk1_pw4";
 				nvidia,function = "extperiph1";
-- 
1.9.3
