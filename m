From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 2/6] dt-bindings: mfd: max77620: Add system-power-controller property
Date: Sun,  5 May 2019 18:43:21 +0300
Message-ID: <20190505154325.30026-3-digetx@gmail.com>
References: <20190505154325.30026-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190505154325.30026-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Document new generic property that designates the PMIC as the system's
power controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/mfd/max77620.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
index b75283787ba1..5a642a51d58e 100644
--- a/Documentation/devicetree/bindings/mfd/max77620.txt
+++ b/Documentation/devicetree/bindings/mfd/max77620.txt
@@ -18,6 +18,11 @@ Optional properties:
 			IRQ numbers for different interrupt source of MAX77620
 			are defined at dt-bindings/mfd/max77620.h.
 
+- system-power-controller: Indicates that this PMIC is controlling the
+			   system power, see [1] for more details.
+
+[1] Documentation/devicetree/bindings/power/power-controller.txt
+
 Optional subnodes and their properties:
 =======================================
 
-- 
2.21.0
