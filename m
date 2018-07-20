From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2] pinctrl: tegra: fix spelling in devicetree binding document
Date: Fri, 20 Jul 2018 10:22:57 +0200
Message-ID: <20180720082258.1590-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This fixes a spelling mistake.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Also fix up the one in nvidia,tegra210-pinmux.txt as suggested by Jon.

 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt | 2 +-
 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
index ecb5c0d25218..f4d06bb0b55a 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
@@ -17,7 +17,7 @@ Tegra124 adds the following optional properties for pin configuration subnodes.
 The macros for options are defined in the
 	include/dt-binding/pinctrl/pinctrl-tegra.h.
 - nvidia,enable-input: Integer. Enable the pin's input path.
-		enable :TEGRA_PIN_ENABLE0 and
+		enable :TEGRA_PIN_ENABLE and
 		disable or output only: TEGRA_PIN_DISABLE.
 - nvidia,open-drain: Integer.
 		enable: TEGRA_PIN_ENABLE.
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
index a62d82d5fbe9..85f211436b8e 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
@@ -44,7 +44,7 @@ Optional subnode-properties:
 - nvidia,tristate: Integer.
     0: drive, 1: tristate.
 - nvidia,enable-input: Integer. Enable the pin's input path.
-    enable :TEGRA_PIN_ENABLE0 and
+    enable :TEGRA_PIN_ENABLE and
     disable or output only: TEGRA_PIN_DISABLE.
 - nvidia,open-drain: Integer.
     enable: TEGRA_PIN_ENABLE.
-- 
2.14.4
