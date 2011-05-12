From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] arm/dt: tegra: Update serial port compatible values
Date: Thu, 12 May 2011 10:41:14 -0600
Message-ID: <1305218474-4087-2-git-send-email-swarren@nvidia.com>
References: <1305218474-4087-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1305218474-4087-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Update the Tegra SoC serial port definitions to additionally be compatible
with the new generic "xscale" type.

I assume this will be squashed into:
commit a487b855dc1e243c52d531896705d0e33941e3a2
arm/dt: full tegra devicetree support

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra250.dtsi |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra250.dtsi b/arch/arm/boot/dts/tegra250.dtsi
index f1801b8..0a251e9 100644
--- a/arch/arm/boot/dts/tegra250.dtsi
+++ b/arch/arm/boot/dts/tegra250.dtsi
@@ -29,7 +29,7 @@
 	};
 
 	serial@70006000 {
-		compatible = "nvidia,tegra250-uart";
+		compatible = "nvidia,tegra250-uart", "xscale";
 		reg = <0x70006000 0x40>;
 		reg-shift = <2>;
 		interrupts = < 68 >;
@@ -37,7 +37,7 @@
 	};
 
 	serial@70006040 {
-		compatible = "nvidia,tegra250-uart";
+		compatible = "nvidia,tegra250-uart", "xscale";
 		reg = <0x70006040 0x40>;
 		reg-shift = <2>;
 		interrupts = < 69 >;
@@ -45,7 +45,7 @@
 	};
 
 	serial@70006200 {
-		compatible = "nvidia,tegra250-uart";
+		compatible = "nvidia,tegra250-uart", "xscale";
 		reg = <0x70006200 0x100>;
 		reg-shift = <2>;
 		interrupts = < 78 >;
@@ -53,7 +53,7 @@
 	};
 
 	serial@70006300 {
-		compatible = "nvidia,tegra250-uart";
+		compatible = "nvidia,tegra250-uart", "xscale";
 		reg = <0x70006300 0x100>;
 		reg-shift = <2>;
 		interrupts = < 122 >;
@@ -61,7 +61,7 @@
 	};
 
 	serial@70006400 {
-		compatible = "nvidia,tegra250-uart";
+		compatible = "nvidia,tegra250-uart", "xscale";
 		reg = <0x70006400 0x100>;
 		reg-shift = <2>;
 		interrupts = < 123 >;
-- 
1.7.0.4
