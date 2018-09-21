From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/9] dt-bindings: tegra186-pmc: Add interrupt controller properties
Date: Fri, 21 Sep 2018 12:25:38 +0200
Message-ID: <20180921102546.12745-2-thierry.reding@gmail.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102546.12745-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The PMC can be a top-level interrupt controller that provides the top-
level controls for wake events. Add optional properties to mark the PMC
as interrupt controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
index c9fd6d1de57e..2d89cdc39eb0 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
@@ -15,6 +15,9 @@ Required properties:
 
 Optional properties:
 - nvidia,invert-interrupt: If present, inverts the PMU interrupt signal.
+- interrupt-controller: Identifies the node as an interrupt controller.
+- #interrupt-cells: Specifies the number of cells needed to encode an
+  interrupt source. The value must be 2.
 
 Example:
 
-- 
2.19.0
