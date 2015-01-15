From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 04/11] ARM: tegra: Set spi-max-frequency property to flash node
Date: Thu, 15 Jan 2015 17:12:16 +0100
Message-ID: <1421338359-27467-5-git-send-email-tomeu.vizoso@collabora.com>
References: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Dylan Reid <dgreid@chromium.org>, Simon Glass <sjg@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

To silence a warning on Nyan boards.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 9a9cffe..94c7ba9 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -1660,6 +1660,7 @@
 
 		flash@0 {
 			compatible = "winbond,w25q32dw";
+			spi-max-frequency = <25000000>;
 			reg = <0>;
 		};
 	};
-- 
1.9.3
