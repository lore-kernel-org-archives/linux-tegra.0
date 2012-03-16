From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 6/8] dt: Move Tegra20 pin mux binding into new pinctrl directory
Date: Fri, 16 Mar 2012 14:54:27 -0600
Message-ID: <1331931269-12262-6-git-send-email-swarren@wwwdotorg.org>
References: <1331931269-12262-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1331931269-12262-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: Linus Walleij <linus.walleij@stericsson.com>, B29396@freescale.com, s.hauer@pengutronix.de, dongas86@gmail.com, shawn.guo@linaro.org, thomas.abraham@linaro.org, tony@atomide.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

This places the file in the new location for all pin controller bindings.

Also, rename the file using the full compatible value for easier
avoidance of conflicts between multiple bindings.

Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
---
 .../bindings/pinctrl/nvidia,tegra20-pinmux.txt     |    5 +++++
 .../devicetree/bindings/pinmux/pinmux_nvidia.txt   |    5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
 delete mode 100644 Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
new file mode 100644
index 0000000..36f82db
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
@@ -0,0 +1,5 @@
+NVIDIA Tegra 2 pinmux controller
+
+Required properties:
+- compatible : "nvidia,tegra20-pinmux"
+
diff --git a/Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt b/Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt
deleted file mode 100644
index 36f82db..0000000
--- a/Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-NVIDIA Tegra 2 pinmux controller
-
-Required properties:
-- compatible : "nvidia,tegra20-pinmux"
-
-- 
1.7.0.4
