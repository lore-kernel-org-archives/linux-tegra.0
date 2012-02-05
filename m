From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 2/3] dt: rfkill-gpio: add bindings documentation
Date: Sun,  5 Feb 2012 18:18:41 +0100
Message-ID: <a2291f385edf9692f4a946fd78a7ee7cca29e3b4.1328461986.git.marvin24@gmx.de>
References: <215249735783e9fe35db1c594d901f591725de50.1328461986.git.marvin24@gmx.de>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <215249735783e9fe35db1c594d901f591725de50.1328461986.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <215249735783e9fe35db1c594d901f591725de50.1328461986.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <215249735783e9fe35db1c594d901f591725de50.1328461986.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add device tree bindings information for rfkill gpio switches.

Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/rfkill.txt |   38 +++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/rfkill.txt

diff --git a/Documentation/devicetree/bindings/gpio/rfkill.txt b/Documentation/devicetree/bindings/gpio/rfkill.txt
new file mode 100644
index 0000000..22bf22a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/rfkill.txt
@@ -0,0 +1,38 @@
+RFKILL switches connected to GPIO lines
+
+Required properties:
+- compatible : should be "rfkill-gpio".
+
+Each rfkill switch is represented as a sub-node of the rfkill-gpio device.
+Each node has a label property which represents the name of the corresponding
+rfkill device.
+
+RFKILL sub-node properties:
+- label :  (optional) The label for this rfkill switch.  If omitted, the label is
+  taken from the node name (excluding the unit address).
+- reset-gpio, shutdown-gpio :  Should specify the rfkill gpios for reset and
+  shutdown (see "Specifying GPIO information for devices" in
+  Documentation/devicetree/booting-without-of.txt).
+- type : enumerated type of the gpio (see include/linux/rfkill.h).
+- clock : (optional) name of the clock name associated with the rfkill switch
+  (see include/linux/rfkill-gpio.h)
+
+Examples:
+
+rfkill-switches {
+	compatible = "rfkill-gpio";
+
+	wifi {
+		label = "wifi";
+		reset-gpio = <&gpio 25 0>; /* Active high */
+		shutdown-gpio = <&gpio 85 0>; /* Active high */
+		type = <1>;
+	};
+
+	bt {
+		label = "bluetooth";
+		reset-gpio = <&gpio 17 0>; /* Active high */
+		shutdown-gpio = <&gpio 35 0>; /* Active high */
+		type = <1>;
+	};
+};
-- 
1.7.5.4

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
