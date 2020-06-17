From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v2 01/18] dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and power-domains
Date: Tue, 16 Jun 2020 18:41:17 -0700
Message-ID: <1592358094-23459-2-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch documents missing clocks and power-domains of Tegra210 VI I2C.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt    | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
index 18c0de3..3f2f990 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
@@ -35,12 +35,12 @@ Required properties:
 	Due to above changes, Tegra114 I2C driver makes incompatible with
 	previous hardware driver. Hence, tegra114 I2C controller is compatible
 	with "nvidia,tegra114-i2c".
-  nvidia,tegra210-i2c-vi: Tegra210 has one I2C controller that is part of the
-	host1x domain and typically used for camera use-cases. This VI I2C
-	controller is mostly compatible with the programming model of the
-	regular I2C controllers with a few exceptions. The I2C registers start
-	at an offset of 0xc00 (instead of 0), registers are 16 bytes apart
-	(rather than 4) and the controller does not support slave mode.
+  nvidia,tegra210-i2c-vi: Tegra210 has one I2C controller that is on host1x bus
+	and is part of VE power domain and typically used for camera use-cases.
+	This VI I2C controller is mostly compatible with the programming model
+	of the regular I2C controllers with a few exceptions. The I2C registers
+	start at an offset of 0xc00 (instead of 0), registers are 16 bytes
+	apart (rather than 4) and the controller does not support slave mode.
 - reg: Should contain I2C controller registers physical address and length.
 - interrupts: Should contain I2C controller interrupts.
 - address-cells: Address cells for I2C device address.
@@ -53,10 +53,17 @@ Required properties:
   - fast-clk
   Tegra114:
   - div-clk
+  Tegra210:
+  - div-clk
+  - slow (only for nvidia,tegra210-i2c-vi compatible node)
 - resets: Must contain an entry for each entry in reset-names.
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - i2c
+- power-domains: Only for nvidia,tegra210-i2c-vi compatible node and must
+  include venc powergate node as vi i2c is part of VE power domain.
+  tegra210-i2c-vi:
+  - pd_venc
 - dmas: Must contain an entry for each entry in clock-names.
   See ../dma/dma.txt for details.
 - dma-names: Must include the following entries:
-- 
2.7.4
