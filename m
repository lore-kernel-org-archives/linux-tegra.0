From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] staging: nvec: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:38:58 +0800
Message-ID: <20191120133858.13369-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org
List-Id: linux-tegra@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/staging/nvec/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/nvec/Kconfig b/drivers/staging/nvec/Kconfig
index 5c12cacf75e1..9fa98c16f1d9 100644
--- a/drivers/staging/nvec/Kconfig
+++ b/drivers/staging/nvec/Kconfig
@@ -8,7 +8,7 @@ config MFD_NVEC
 	    controller.
 
 	    To compile this driver as a module, say M here: the module will be
-            called mfd-nvec
+	    called mfd-nvec
 
 config KEYBOARD_NVEC
 	tristate "Keyboard on nVidia compliant EC"
@@ -18,7 +18,7 @@ config KEYBOARD_NVEC
 	  a nVidia compliant embedded controller.
 
 	  To compile this driver as a module, say M here: the module will be
-          called keyboard-nvec
+	  called keyboard-nvec
 
 config SERIO_NVEC_PS2
 	tristate "PS2 on nVidia EC"
@@ -28,7 +28,7 @@ config SERIO_NVEC_PS2
 	  to a nVidia compliant embedded controller.
 
 	  To compile this driver as a module, say M here: the module will be
-          called serio-nvec-ps2
+	  called serio-nvec-ps2
 
 
 config NVEC_POWER
@@ -39,7 +39,7 @@ config NVEC_POWER
 	  nVidia compliant embedded controllers.
 
 	  To compile this driver as a module, say M here: the module will be
-          called nvec-power
+	  called nvec-power
 
 
 config NVEC_PAZ00
@@ -50,5 +50,5 @@ config NVEC_PAZ00
 	  devices, e.g. Toshbia AC100 and Dynabooks AZ netbooks.
 
 	  To compile this driver as a module, say M here: the module will be
-          called nvec-paz00
+	  called nvec-paz00
 
-- 
2.17.1
