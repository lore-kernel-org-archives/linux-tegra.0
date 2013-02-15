From: Rhyland Klein <rklein@nvidia.com>
Subject: [RFC 1/3] power_supply: Define Binding for supplied-nodes
Date: Fri, 15 Feb 2013 18:36:54 -0500
Message-ID: <1360971416-30717-2-git-send-email-rklein@nvidia.com>
References: <1360971416-30717-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360971416-30717-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <cbou@mail.ru>, David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This property is meant to be used in device nodes which represent
power_supply devices that wish to provide a list of supplies to
which they provide power. A common case is a AC Charger with
the batteries it powers.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 .../bindings/power_supply/power_supply.txt         |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power_supply/power_supply.txt

diff --git a/Documentation/devicetree/bindings/power_supply/power_supply.txt b/Documentation/devicetree/bindings/power_supply/power_supply.txt
new file mode 100644
index 0000000..1c58d4ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/power_supply/power_supply.txt
@@ -0,0 +1,17 @@
+Power Supply Core Support
+
+Optional Properties:
+ - power-supply,supplied-nodes : This property is added to a supply
+   in order to specify the list of supplicant devices directly by their
+   phandles.
+
+Example:
+
+	charger@e {
+		compatible = "some,charger";
+		...
+
+		power-supply,supplied-nodes = <&some_battery>,
+					      <&another_battery>;
+		...
+	};
-- 
1.7.9.5
