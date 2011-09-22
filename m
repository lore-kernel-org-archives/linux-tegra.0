From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] arm/dt: Tegra: Add pinmux node to tegra20.dtsi
Date: Thu, 22 Sep 2011 15:06:05 -0600
Message-ID: <1316725567-17881-3-git-send-email-swarren@nvidia.com>
References: <1316725567-17881-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316725567-17881-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add a pinmux node to tegra20.dtsi in order to instantiate the future
pinmux device.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
See patch 0000 for details on dependencies.

 .../devicetree/bindings/pinmux/pinmux_nvidia.txt   |    5 +++++
 arch/arm/boot/dts/tegra20.dtsi                     |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt

diff --git a/Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt b/Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt
new file mode 100644
index 0000000..36f82db
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt
@@ -0,0 +1,5 @@
+NVIDIA Tegra 2 pinmux controller
+
+Required properties:
+- compatible : "nvidia,tegra20-pinmux"
+
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 5727595..5921c1d 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -77,6 +77,11 @@
 		gpio-controller;
 	};
 
+	pinmux: pinmux@70000000 {
+		compatible = "nvidia,tegra20-pinmux";
+		reg = < 0x70000000 0xc00 >;
+	};
+
 	serial@70006000 {
 		compatible = "nvidia,tegra20-uart";
 		reg = <0x70006000 0x40>;
-- 
1.7.0.4
