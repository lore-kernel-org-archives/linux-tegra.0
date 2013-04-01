From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/3] power_supply: Define Binding for power-supplies
Date: Mon, 1 Apr 2013 17:45:53 -0400
Message-ID: <1364852755-17425-2-git-send-email-rklein@nvidia.com>
References: <1364852755-17425-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364852755-17425-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This property is meant to be used in device nodes which represent
power_supply devices that wish to provide a list of supplies which
provide them power, such as a battery listing its chargers.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
 - no changes

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
