From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v1 3/3] ARM: tegra: Add gpio-ranges property
Date: Wed,  1 Jul 2015 14:45:53 +0200
Message-ID: <1435754753-31307-4-git-send-email-tomeu.vizoso@collabora.com>
References: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Specify how the GPIOs map to the pins in Tegra SoCs, so the dependency is
explicit.

This currently will add a duplicated entry in the map from pins to gpios
in the pinmux controller but it should be harmless and will be fixed in a
later commit.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

 arch/arm/boot/dts/tegra114.dtsi | 1 +
 arch/arm/boot/dts/tegra124.dtsi | 1 +
 arch/arm/boot/dts/tegra20.dtsi  | 1 +
 arch/arm/boot/dts/tegra30.dtsi  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index f58a3d9..7e1e171 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -234,6 +234,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
+		gpio-ranges = <&pinmux 0 0 246>;
 	};
 
 	apbmisc@70000800 {
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 87318a7..4779df3 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -255,6 +255,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
+		gpio-ranges = <&pinmux 0 0 251>;
 	};
 
 	apbdma: dma@0,60020000 {
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index f444b67..b44277c 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -244,6 +244,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
+		gpio-ranges = <&pinmux 0 0 224>;
 	};
 
 	apbmisc@70000800 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 782b11b..28c547f 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -349,6 +349,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
+		gpio-ranges = <&pinmux 0 0 248>;
 	};
 
 	apbmisc@70000800 {
-- 
2.4.1
