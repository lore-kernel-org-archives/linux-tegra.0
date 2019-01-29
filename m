From: Mark Zhang <markz@nvidia.com>
Subject: [PATCH v2 4/4] mfd: max77620: add documentation for low battery monitoring
Date: Tue, 29 Jan 2019 16:55:31 +0800
Message-ID: <20190129085531.32364-5-markz@nvidia.com>
References: <20190129085531.32364-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129085531.32364-1-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, blaws05@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Adding documentation for low battery monitor properties:
- maxim,low-battery-dac-enable
- maxim,low-battery-dac-disable
- maxim,low-battery-shutdown-enable
- maxim,low-battery-shutdown-disable
- maxim,low-battery-reset-enable
- maxim,low-battery-reset-disable

Signed-off-by: Mark Zhang <markz@nvidia.com>
---
 Documentation/devicetree/bindings/mfd/max77620.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documenta=
tion/devicetree/bindings/mfd/max77620.txt
index 484b17e4fba5..5fed0a463b80 100644
--- a/Documentation/devicetree/bindings/mfd/max77620.txt
+++ b/Documentation/devicetree/bindings/mfd/max77620.txt
@@ -142,6 +142,20 @@ Optional properties:
 			Device supports 100/1000/3000/6000 Ohms.
 			Default will be set to 1000 Ohm.
=20
+Low-Battery Monitor:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+This sub-node configure low battery monitor configuration registers. Devic=
e has
+support for low-battery monitor configuration through child DT node
+"low-battery-monitor".
+
+Optional properties:
+	- maxim,low-battery-dac-enable: Enable low battery DAC.
+	- maxim,low-battery-dac-disable: Disable low battery DAC.
+	- maxim,low-battery-shutdown-enable: Enable low battery shutdown.
+	- maxim,low-battery-shutdown-disable: Disable low battery shutdown.
+	- maxim,low-battery-reset-enable: Enable low battery reset.
+	- maxim,low-battery-reset-disable: Disable low battery reset.
+
 Example:
 --------
 #include <dt-bindings/mfd/max77620.h>
--=20
2.19.2
