From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v10 2/9] dt-bindings: pinctrl: Deprecate Tegra XUSB pad controller binding
Date: Fri,  4 Mar 2016 17:19:32 +0100
Message-ID: <1457108379-20794-2-git-send-email-thierry.reding@gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is an old version of the binding that isn't flexible enough to
describe all aspects of the XUSB pad controller. Specifically with the
addition of XUSB support (for SuperSpeed USB) the existing binding is
no longer suitable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
index 77dfba05ccfd..8a6223dbc143 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
@@ -5,6 +5,7 @@ NOTE: It turns out that this binding isn't an accurate description of the XUSB
 pad controller. While the description is good enough for the functional subset
 required for PCIe and SATA, it lacks the flexibility to represent the features
 needed for USB. For the new binding, see ../phy/nvidia,tegra-xusb-padctl.txt.
+The binding described in this file is deprecated and should not be used.
 
 The Tegra XUSB pad controller manages a set of lanes, each of which can be
 assigned to one out of a set of different pads. Some of these pads have an
-- 
2.7.1
