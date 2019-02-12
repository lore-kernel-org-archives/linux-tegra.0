From: Mark Zhang <markz@nvidia.com>
Subject: [PATCH v3 2/4] mfd: max77620: add documentation for backup battery charging
Date: Tue, 12 Feb 2019 14:43:51 +0800
Message-ID: <20190212064353.7451-3-markz@nvidia.com>
References: <20190212064353.7451-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212064353.7451-1-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Adding documentation for 3 new backup battery charging dts
properties:
- maxim,charging-current-microamp
- maxim,charging-voltage-microvolt
- maxim,output-resister-ohms

Signed-off-by: Mark Zhang <markz@nvidia.com>
---
 .../devicetree/bindings/mfd/max77620.txt      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documenta=
tion/devicetree/bindings/mfd/max77620.txt
index 9c16d51cc15b..88825eaf2567 100644
--- a/Documentation/devicetree/bindings/mfd/max77620.txt
+++ b/Documentation/devicetree/bindings/mfd/max77620.txt
@@ -122,6 +122,26 @@ For DT binding details of different sub modules like G=
PIO, pincontrol,
 regulator, power, please refer respective device-tree binding document
 under their respective sub-system directories.
=20
+Backup Battery:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+This sub-node configure charging backup battery of the device. Device has
+support of charging the backup battery. The subnode name is "backup-batter=
y".
+The property for backup-battery child nodes as:
+Presence of this child node will enable the backup battery charging.
+
+Optional properties:
+	-maxim,charging-current-microamp: Charging current setting.
+			The device supports 50/100/200/400/600/800uA.
+			If this property is unavailable then it will
+			charge with 50uA.
+	-maxim,charging-voltage-microvolt: Charging Voltage Limit Setting.
+			Device supports 2500000/3000000/3300000/350000uV.
+			Default will be set to 2500mV. The voltage will be roundoff
+			to nearest lower side if other than above is configured.
+	-maxim,output-resister-ohms: Output resistor on Ohm.
+			Device supports 100/1000/3000/6000 Ohms.
+			Default will be set to 1000 Ohm.
+
 Example:
 --------
 #include <dt-bindings/mfd/max77620.h>
--=20
2.19.2
