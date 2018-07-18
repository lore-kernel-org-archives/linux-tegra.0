From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] ARM: tegra: apalis-tk1: Fix SPDX license identifier format
Date: Wed, 18 Jul 2018 21:48:22 +0200
Message-ID: <20180718194824.3704-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Philippe Ombredanne <pombredanne@nexb.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-tegra@vger.kernel.org

Fix incorrect format used for OR clause in SPDX license identifier.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index 8a8d5fa0ecd1..e2c0d8efb358 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright 2016-2018 Toradex AG
  */
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 573aaa50fff1..5ef84b6b3356 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright 2016-2018 Toradex AG
  */
-- 
2.14.1
