From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v4 05/11] ARM: tegra: Add node for trackpad in Nyan boards
Date: Wed, 11 Feb 2015 16:06:37 +0100
Message-ID: <1423667220-1062-6-git-send-email-tomeu.vizoso@collabora.com>
References: <1423667220-1062-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423667220-1062-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Simon Glass <sjg@chromium.org>, Dylan Reid <dgreid@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Nyan boards have a eKTH3000 from Elan as their trackpad, connected
through I2C.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm/boot/dts/tegra124-nyan.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index c0ee53f..579b0b9 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -71,6 +71,14 @@
 	i2c@0,7000c400 {
 		status = "okay";
 		clock-frequency = <100000>;
+
+		trackpad@15 {
+			compatible = "elan,ekth3000";
+			reg = <0x15>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_EDGE_FALLING>;
+			wakeup-source;
+		};
 	};
 
 	i2c@0,7000c500 {
-- 
1.9.3
