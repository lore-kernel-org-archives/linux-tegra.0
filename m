From: Romain Perier <romain.perier@gmail.com>
Subject: [PATCH v1 2/5] ARM: dts: tegra: Use poweroff-source DT property in tps65911 for tegra30 apalis
Date: Wed, 22 Oct 2014 15:26:24 +0000
Message-ID: <1413991587-11110-2-git-send-email-romain.perier@gmail.com>
References: <1413991587-11110-1-git-send-email-romain.perier@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413991587-11110-1-git-send-email-romain.perier@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: lee.jones@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, grant.likely@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, broonie@kernel.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 arch/arm/boot/dts/tegra30-apalis.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index a5446cb..796e83b 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -412,7 +412,7 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 
-			ti,system-power-controller;
+			poweroff-source;
 
 			#gpio-cells = <2>;
 			gpio-controller;
-- 
1.9.1
