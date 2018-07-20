From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] pinctrl: tegra: fix spelling in devicetree binding document
Date: Fri, 20 Jul 2018 09:52:35 +0200
Message-ID: <20180720075235.18617-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This fixes a spelling mistake.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.14.4
