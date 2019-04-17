From: Igor Opaniuk <igor.opaniuk@toradex.com>
Subject: [PATCH v4 2/2] ARM: dts: tegra124-apalis: convert to SPDX license tags
Date: Wed, 17 Apr 2019 15:30:15 +0200
Message-ID: <20190417133015.6168-2-igor.opaniuk@toradex.com>
References: <20190417133015.6168-1-igor.opaniuk@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417133015.6168-1-igor.opaniuk@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-imx@nxp.com
Cc: marc.w.gonzalez@free.fr, jonathanh@nvidia.com, thierry.reding@gmail.com, festevam@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, marcel@ziswiler.com, marcel.ziswiler@toradex.com, stefan@agner.ch
List-Id: linux-tegra@vger.kernel.org

Replace boiler plate licenses texts with the SPDX license
identifiers in Colibri/Apalis DTS files.

Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@toradex.com>
---
v4:
- Fix typo in the SPDX tag, noticed by Marc (probably was introduced when
  manually removing unneeded brackets)

v3:
- Add Marcel's Acked-by tag
- Remove un-needed parentheses in SPDX line
- Replace MIT with GPL-2.0 in tegra124-apalis-emc.dtsi

v2:
- Address Stefan's comment: replace GPL-2.0+ instead GPL-2.0

 arch/arm/boot/dts/tegra124-apalis-emc.dtsi | 39 ++-------------------
 arch/arm/boot/dts/tegra124-apalis-eval.dts | 40 ++--------------------
 arch/arm/boot/dts/tegra124-apalis.dtsi     | 40 ++--------------------
 3 files changed, 6 insertions(+), 113 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
index ca2c3a557895..d18eaf4a4a3a 100644
--- a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
@@ -1,42 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
 /*
- * Copyright 2016 Toradex AG
+ * Copyright 2016-2019 Toradex AG
  *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License
- *     version 2 as published by the Free Software Foundation.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
 / {
diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index eaee10ef6512..ceb3f6388c7d 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
 /*
- * Copyright 2016-2018 Toradex AG
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License
- *     version 2 as published by the Free Software Foundation.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
+ * Copyright 2016-2019 Toradex AG
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 13c93cd507d8..fdc8a4c5aab6 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
 /*
- * Copyright 2016-2018 Toradex AG
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License
- *     version 2 as published by the Free Software Foundation.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
+ * Copyright 2016-2019 Toradex AG
  */
 
 #include "tegra124.dtsi"
-- 
2.17.1
