From: Rhyland Klein <rklein@nvidia.com>
Subject: [Patch v3 3/4] power_supply: tps65090-charger: Add binding doc
Date: Tue, 12 Mar 2013 18:08:08 -0400
Message-ID: <1363126089-9071-4-git-send-email-rklein@nvidia.com>
References: <1363126089-9071-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363126089-9071-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Anton Vorontsov <cbou@mail.ru>, Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Laxman Dewangan <ldewangan@nvidia.com>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This change adds the binding documentation for the tps65090-charger.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v3:
 - no changes since v2
v2:
 - no changes since v1

 .../devicetree/bindings/power_supply/tps65090.txt  |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power_supply/tps65090.txt

diff --git a/Documentation/devicetree/bindings/power_supply/tps65090.txt b/Documentation/devicetree/bindings/power_supply/tps65090.txt
new file mode 100644
index 0000000..56370c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/power_supply/tps65090.txt
@@ -0,0 +1,23 @@
+TPS65090 Frontend PMU with Switchmode Charger
+
+Required Properties:
+-compatible: "ti,tps65090"
+-reg: I2C slave address
+-interrupts: the interrupt output to which this device connects
+
+Optional Properties:
+-ti,enable-low-current-chrg: Enables charging when a low current is detected
+ while the default logic is to stop charging.
+
+Example:
+
+	tps65090@48 {
+		compatible = "ti,tps65090";
+		reg = <0x48>;
+		interrupts = <0 88 0x4>;
+
+		ti,enable-low-current-chrg;
+
+		regulators {
+			...
+		};
-- 
1.7.9.5
