From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [REPOST Patch v1 1/3] power_supply: Define Binding for power-supplies
Date: Mon, 25 Mar 2013 22:24:48 -0400
Message-ID: <1364264690-2124-2-git-send-email-rklein@nvidia.com>
References: <1364264690-2124-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364264690-2124-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This property is meant to be used in device nodes which represent
power_supply devices that wish to provide a list of supplies which
provide them power, such as a battery listing its chargers.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v1:
 - changed from RFC v2 -> patch v1
 - made poropery plural as it can be a list
 - update example with plural & changed once charger address

v2 (RFC):
 - changed property to "power-supply" which should be contained in the
   battery rather than the charger. Also updated example to match

 .../bindings/power_supply/power_supply.txt         |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power_supply/power_supply.txt

diff --git a/Documentation/devicetree/bindings/power_supply/power_supply.txt b/Documentation/devicetree/bindings/power_supply/power_supply.txt
new file mode 100644
index 0000000..8391bfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/power_supply/power_supply.txt
@@ -0,0 +1,23 @@
+Power Supply Core Support
+
+Optional Properties:
+ - power-supplies : This property is added to a supply in order to list the
+   devices which supply it power, referenced by their phandles.
+
+Example:
+
+	usb-charger: power@e {
+		compatible = "some,usb-charger";
+		...
+	};
+
+	ac-charger: power@c {
+		compatible = "some,ac-charger";
+		...
+	};
+
+	battery@b {
+		compatible = "some,battery";
+		...
+		power-supplies = <&usb-charger>, <&ac-charger>;
+	};
-- 
1.7.9.5
