From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/3] dt-bindings: phy: tegra-xusb: List PLL power supplies
Date: Thu, 25 Apr 2019 17:34:42 +0200
Message-ID: <20190425153444.6281-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These power supplies provide power for various PLLs that are set up and
driven by the XUSB pad controller. These power supplies were previously
improperly added to the PCIe and XUSB controllers, but depending on the
driver probe order, power to the PLLs will not be supplied soon enough
and cause initialization to fail.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
This was previously reviewed here:

    https://patchwork.ozlabs.org/patch/1077153/

 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index daedb15f322e..9fb682e47c29 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -42,6 +42,18 @@ Required properties:
 - reset-names: Must include the following entries:
   - "padctl"
 
+For Tegra124:
+- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
+- avdd-pll-erefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
+- avdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 3.3 V.
+
+For Tegra210:
+- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
+- avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
+- dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
+
 For Tegra186:
 - avdd-pll-erefeut-supply: UPHY brick and reference clock as well as UTMI PHY
   power supply. Must supply 1.8 V.
-- 
2.21.0
