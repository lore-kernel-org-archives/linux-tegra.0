From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 1/2] ARM: tegra: roth: fix unsupported pinmux properties
Date: Mon, 23 Jun 2014 16:32:58 +0900
Message-ID: <1403508779-25896-2-git-send-email-acourbot@nvidia.com>
References: <1403508779-25896-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403508779-25896-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The pinmux subsystem complained that the nvidia,low-power-mode property
is not supported by the sdio1, sdio3 and gma drive groups. In addition
gma also does not support nvidia,drive-type. Remove these properties so
the pinmux configuration can properly be applied.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm/boot/dts/tegra114-roth.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 0b0e8e07d965..a67885250f81 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -730,7 +730,6 @@
 				nvidia,pins = "drive_sdio1";
 				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
 				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
 				nvidia,pull-down-strength = <36>;
 				nvidia,pull-up-strength = <20>;
 				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOW>;
@@ -740,7 +739,6 @@
 				nvidia,pins = "drive_sdio3";
 				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
 				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
 				nvidia,pull-down-strength = <36>;
 				nvidia,pull-up-strength = <20>;
 				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
@@ -750,12 +748,10 @@
 				nvidia,pins = "drive_gma";
 				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
 				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
 				nvidia,pull-down-strength = <2>;
 				nvidia,pull-up-strength = <2>;
 				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
 				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-				nvidia,drive-type = <1>;
 			};
 		};
 	};
-- 
2.0.0
