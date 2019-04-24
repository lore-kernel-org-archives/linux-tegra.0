From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 5/6] dt-bindings: mfd: max77620: Add maxim,system-power-controller property
Date: Thu, 25 Apr 2019 01:48:59 +0300
Message-ID: <20190424224900.8018-6-digetx@gmail.com>
References: <20190424224900.8018-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424224900.8018-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add new property that designates the PMIC as the system's power
controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/mfd/max77620.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
index 9058499051e0..dda6d158b170 100644
--- a/Documentation/devicetree/bindings/mfd/max77620.txt
+++ b/Documentation/devicetree/bindings/mfd/max77620.txt
@@ -18,6 +18,9 @@ Optional properties:
 			IRQ numbers for different interrupt source of MAX77620
 			are defined at dt-bindings/mfd/max77620.h.
 
+- maxim,system-power-controller: Indicates that this PMIC is controlling the
+				 system power.
+
 Optional subnodes and their properties:
 =======================================
 
-- 
2.21.0
