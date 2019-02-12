From: Mark Zhang <markz@nvidia.com>
Subject: [PATCH v3 4/4] mfd: max77620: add documentation for low battery monitoring
Date: Tue, 12 Feb 2019 14:43:53 +0800
Message-ID: <20190212064353.7451-5-markz@nvidia.com>
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

Adding documentation for low battery monitor properties:
- maxim,low-battery-dac-enable
- maxim,low-battery-mode

Signed-off-by: Mark Zhang <markz@nvidia.com>
---
 Documentation/devicetree/bindings/mfd/max77620.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documenta=
tion/devicetree/bindings/mfd/max77620.txt
index 88825eaf2567..f5b298ccc929 100644
--- a/Documentation/devicetree/bindings/mfd/max77620.txt
+++ b/Documentation/devicetree/bindings/mfd/max77620.txt
@@ -142,6 +142,20 @@ Optional properties:
 			Device supports 100/1000/3000/6000 Ohms.
 			Default will be set to 1000 Ohm.
=20
+Low-Battery Monitor:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+max77620 is able to monitor the main battery voltage and shutdown/reset th=
e
+chip connected accordingly.
+
+Optional properties:
+	- maxim,low-battery-dac-enable: Enable low battery monitoring.
+			Low battery monitoring will be disabled if missing
+			this property.
+	- maxim,low-battery-mode: Shutdown or reset the chip.
+			The value of this property is "shutdown" which means
+			a global shutdown will be triggered. Any other values
+			or missing this property causes a chip reset.
+
 Example:
 --------
 #include <dt-bindings/mfd/max77620.h>
--=20
2.19.2
