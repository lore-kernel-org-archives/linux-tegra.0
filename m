From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 06/26] ARM: tegra: colibri_t30: annotate uarts
Date: Mon, 23 Jul 2018 14:36:37 +0200
Message-ID: <20180723123658.980-7-marcel@ziswiler.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate UARTs.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 1c057b285153..5b32a70ceff2 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -33,15 +33,18 @@
 		};
 	};
 
+	/* Colibri UART-A */
 	serial@70006000 {
 		status = "okay";
 	};
 
+	/* Colibri UART-C */
 	serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
 
+	/* Colibri UART-B */
 	serial@70006300 {
 		compatible = "nvidia,tegra30-hsuart";
 		status = "okay";
-- 
2.14.4
