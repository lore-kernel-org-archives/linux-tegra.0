From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 04/11] dt-bindings: display: Update Tegra DPAUX documentation
Date: Wed, 29 Jun 2016 10:17:50 +0100
Message-ID: <1467191877-26017-5-git-send-email-jonathanh@nvidia.com>
References: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Update the DPAUX compatibility string information for Tegra124, Tegra132
and Tegra210.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index a3bd8c050c4e..275f45680892 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -226,9 +226,9 @@ of the following host1x client modules:
   - nvidia,dpaux: phandle to a DispayPort AUX interface
 
 - dpaux: DisplayPort AUX interface
-  - compatible: For Tegra124, must contain "nvidia,tegra124-dpaux".  Otherwise,
-    must contain '"nvidia,<chip>-dpaux", "nvidia,tegra124-dpaux"', where
-    <chip> is tegra132.
+  - compatible : Should contain one of the following:
+    - "nvidia,tegra124-dpaux": for Tegra124 and Tegra132
+    - "nvidia,tegra210-dpaux": for Tegra210
   - reg: Physical base address and length of the controller's registers.
   - interrupts: The interrupt outputs from the controller.
   - clocks: Must contain an entry for each entry in clock-names.
-- 
2.1.4
