From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v6 11/12] ARM: tegra: Add gpio-restart node
Date: Wed, 18 Mar 2015 10:52:26 +0100
Message-ID: <1426672363-30667-12-git-send-email-tomeu.vizoso@collabora.com>
References: <1426672363-30667-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426672363-30667-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Nyan Chromebooks have a GPIO line dedicated to restarting the
system. Using this line will make sure that the TPM is restarted as
well.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Stephen Warren <swarren@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm/boot/dts/tegra124-nyan.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 9b3fca8..0b130cb 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -683,6 +683,12 @@
 		nvidia,mic-det-gpios =
 				<&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
 	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
+		priority = <200>;
+	};
 };
 
 #include "cros-ec-keyboard.dtsi"
-- 
2.1.0
