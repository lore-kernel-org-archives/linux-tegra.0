From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] ARM: tegra: TN7: relax some regulators
Date: Thu, 19 Jun 2014 16:49:14 +0900
Message-ID: <1403164154-1362-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Remove the regulator-always-on property from some regulators that do not
need it. On recent kernels fixed regulators which supply is always on
fail registration.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Stephen, do you think you could queue this for 3.16-rc2 or 3? Without
this the TN7 panel does not show up which makes the device virtually
unusable.

 arch/arm/boot/dts/tegra114-tn7.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 963662145635..abcfe77c3a99 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -114,7 +114,6 @@
 						regulator-name = "vs-pmu-1v8";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
-						regulator-always-on;
 						regulator-boot-on;
 					};
 
@@ -130,7 +129,6 @@
 						regulator-name = "vd-smps10-out1";
 						regulator-min-microvolt = <5000000>;
 						regulator-max-microvolt = <5000000>;
-						regulator-always-on;
 						regulator-boot-on;
 					};
 
@@ -138,7 +136,6 @@
 						regulator-name = "vd-smps10-out2";
 						regulator-min-microvolt = <5000000>;
 						regulator-max-microvolt = <5000000>;
-						regulator-always-on;
 						regulator-boot-on;
 					};
 
-- 
2.0.0
